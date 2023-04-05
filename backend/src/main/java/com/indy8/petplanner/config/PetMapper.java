package com.indy8.petplanner.config;

import com.indy8.petplanner.domain.Pet;
import com.indy8.petplanner.pets.CreateNewPetRequest;
import com.indy8.petplanner.pets.CreateNewPetResponse;
import com.indy8.petplanner.pets.PetByIdResponse;

public class PetMapper {
    public Pet mapCreateNewPetRequestToPet(CreateNewPetRequest request) {
        var pet = new Pet();
        pet.setName(request.getName());
        pet.setBreed(request.getBreed());
        pet.setColor(request.getColor());
        pet.setAnimalType(request.getAnimalType());
        pet.setDateOfBirth(request.getDateOfBirth());
        pet.setPlaygroup(request.getPlaygroup());
        pet.setWeight(request.getWeight());
        return pet;
    }

    public CreateNewPetResponse mapPetToCreateNewPetResponse(Pet pet) {
        var response = new CreateNewPetResponse();
        response.setId(pet.getId());
        response.setName(pet.getName());
        response.setBreed(pet.getBreed());
        response.setColor(pet.getColor());
        response.setClientId(pet.getClient().getId());
        response.setAnimalType(pet.getAnimalType());
        response.setDateOfBirth(pet.getDateOfBirth());
        response.setPlaygroup(pet.getPlaygroup());
        response.setWeight(pet.getWeight());

        return response;
    }

    public PetByIdResponse mapPetToPetByIdResponse(Pet pet) {
        var response = new PetByIdResponse();
        response.setId(pet.getId());
        response.setName(pet.getName());
        response.setBreed(pet.getBreed());
        response.setColor(pet.getColor());
        response.setClientId(pet.getClient().getId());
        response.setAnimalType(pet.getAnimalType());
        response.setDateOfBirth(pet.getDateOfBirth());
        response.setPlaygroup(pet.getPlaygroup());
        response.setWeight(pet.getWeight());

        return response;
    }
}
