package com.indy8.petplanner.config;

import com.indy8.petplanner.feedings.FeedingByIdResponse;
import com.indy8.petplanner.feedings.CreateNewFeedingRequest;
import com.indy8.petplanner.feedings.CreateNewFeedingResponse;
import com.indy8.petplanner.domain.Feeding;
import com.indy8.petplanner.feedings.UpdateFeedingResponse;

public class FeedingMapper {
    public FeedingByIdResponse mapFeedingToFeedingByIdResponse(Feeding feeding) {
        var response = new FeedingByIdResponse();

        response.setId(feeding.getId());
        response.setFoodType(feeding.getFoodType());
        response.setBrand(feeding.getBrand());
        response.setQuantity(feeding.getQuantity());
        response.setUnitOfMeasure(feeding.getUnitOfMeasure());
        response.setTimeOfDay(feeding.getTimeOfDay());
        response.setMedicines(feeding.getMedicines());
        response.setDose(feeding.getDose());
        response.setName(feeding.getName());

        return response;
    }
    public CreateNewFeedingResponse mapFeedingToCreateNewFeedingResponse(Feeding feeding) {
        var response = new CreateNewFeedingResponse();

        response.setId(feeding.getId());
        response.setFoodType(feeding.getFoodType());
        response.setBrand(feeding.getBrand());
        response.setQuantity(feeding.getQuantity());
        response.setUnitOfMeasure(feeding.getUnitOfMeasure());
        response.setTimeOfDay(feeding.getTimeOfDay());
        response.setMedicines(feeding.getMedicines());
        response.setDose(feeding.getDose());
        response.setName(feeding.getName());

        return response;
    }
    public Feeding mapCreateNewFeedingRequestToFeeding(CreateNewFeedingRequest request) {
        var feeding = new Feeding();

        feeding.setFoodType(request.getFoodType());
        feeding.setBrand(request.getBrand());
        feeding.setQuantity(request.getQuantity());
        feeding.setUnitOfMeasure(request.getUnitOfMeasure());
        feeding.setTimeOfDay(request.getTimeOfDay());
        feeding.setMedicines(request.getMedicines());
        feeding.setDose(request.getDose());
        feeding.setName(request.getName());

        return feeding;
    }

    public UpdateFeedingResponse mapFeedingToUpdateFeedingResponse(Feeding feeding) {
        var response = new UpdateFeedingResponse();

        response.setId(feeding.getId());
        response.setFoodType(feeding.getFoodType());
        response.setBrand(feeding.getBrand());
        response.setQuantity(feeding.getQuantity());
        response.setUnitOfMeasure(feeding.getUnitOfMeasure());
        response.setTimeOfDay(feeding.getTimeOfDay());
        response.setMedicines(feeding.getMedicines());
        response.setDose(feeding.getDose());
        response.setName(feeding.getName());

        return response;
    }
}
