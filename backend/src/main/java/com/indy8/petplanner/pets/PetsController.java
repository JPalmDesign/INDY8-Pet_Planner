package com.indy8.petplanner.pets;

import com.indy8.petplanner.config.PetMapper;
import com.indy8.petplanner.dataaccess.ClientRepository;
import com.indy8.petplanner.dataaccess.PetRepository;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

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

    @GetMapping("/pet")
    public PetByIdResponse getPetById(@RequestParam(value = "id") Integer id) {
        var dbResult = petRepository.findById(id);
        if (dbResult.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "pet not found"
            );
        }
        return this.petMapper.mapPetToPetByIdResponse(dbResult.get());
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


}
