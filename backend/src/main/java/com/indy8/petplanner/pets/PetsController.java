package com.indy8.petplanner.pets;

import com.indy8.petplanner.clients.ClientByIdResponse;
import com.indy8.petplanner.config.PetMapper;
import com.indy8.petplanner.dataaccess.ClientRepository;
import com.indy8.petplanner.dataaccess.PetRepository;
import com.indy8.petplanner.domain.Pet;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;

@RestController
public class PetsController {

    private final PetRepository petRepository;
    private final ClientRepository clientRepository;
    private final PetMapper petMapper;


    public PetsController(PetRepository petRepository, ClientRepository clientRepository, PetMapper petMapper) {
        this.petRepository = petRepository;
        this.clientRepository = clientRepository;
        this.petMapper = petMapper;
    }

    @GetMapping("/pet/{id}")
    public PetByIdResponse getPetById(@PathVariable Integer id) {
        var dbResult = petRepository.findById(id);
        if (dbResult.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "pet not found"
            );
        }
        return this.petMapper.mapPetToPetByIdResponse(dbResult.get());
    }

    @GetMapping("/pet")
    public List<PetByIdResponse> getAllPets() {
        var dbResult = petRepository.findAll();
        var response = new ArrayList<PetByIdResponse>();
        for(var pet : dbResult) {
            response.add(this.petMapper.mapPetToPetByIdResponse(pet));
        }
        return response;
    }

    @PostMapping("/pet")
    public CreateNewPetResponse createNewPet(@RequestBody CreateNewPetRequest createNewPetRequest){
        var pet = this.petMapper.mapCreateNewPetRequestToPet(createNewPetRequest);
        var clientResult = this.clientRepository.findById(createNewPetRequest.getClientId());
        if(clientResult.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "pet has no existing client"
            );
        }
        var client = clientResult.get();
        client.addPet(pet);
        petRepository.save(pet);
        var response = this.petMapper.mapPetToCreateNewPetResponse(pet);
        return response;
    }

    @PutMapping("/pet/{id}")
    public UpdatePetResponse updatePet(@RequestBody UpdatePetRequest updatePetRequest, @PathVariable Integer id) {
        var dbResult = petRepository.findById(id);
        if (dbResult.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "pet not found"
            );
        }
        var pet = dbResult.get();
        updatePet(updatePetRequest, pet);
        petRepository.save(pet);
        return this.petMapper.mapPetToUpdatePetResponse(pet);
    }

    private static void updatePet(UpdatePetRequest updatePetRequest, Pet pet) {
        pet.setName(updatePetRequest.getName());
        pet.setAnimalType(updatePetRequest.getAnimalType());
        pet.setDateOfBirth(updatePetRequest.getDateOfBirth());
        pet.setBreed(updatePetRequest.getBreed());
        pet.setColor(updatePetRequest.getColor());
        pet.setWeight(updatePetRequest.getWeight());
    }

    @DeleteMapping("/pet/{id}")
    public ResponseEntity<String> deletePet(@PathVariable Integer id) {
        var dbResult = petRepository.findById(id);
        if (dbResult.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "pet not found"
            );
        }
        petRepository.delete(dbResult.get());
        return new ResponseEntity<>("Pet deleted", HttpStatus.OK);
    }
}
