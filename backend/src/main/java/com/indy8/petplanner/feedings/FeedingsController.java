package com.indy8.petplanner.feedings;

import com.indy8.petplanner.config.FeedingMapper;
import com.indy8.petplanner.dataaccess.FeedingRepository;
import com.indy8.petplanner.dataaccess.PetRepository;
import com.indy8.petplanner.domain.Feeding;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class FeedingsController {
    private final FeedingRepository feedingRepository;
    private final PetRepository petRepository;
    private final FeedingMapper feedingMapper;

    public FeedingsController(FeedingRepository feedingRepository, PetRepository petRepository, FeedingMapper feedingMapper) {
        this.feedingRepository = feedingRepository;
        this.petRepository = petRepository;
        this.feedingMapper = feedingMapper;
    }

    @GetMapping("/feeding/{id}")
    public FeedingByIdResponse getFeedingById(@PathVariable Integer id) {
        var dbResult = feedingRepository.findById(id);
        if (dbResult.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "entity not found"
            );
        }
        return this.feedingMapper.mapFeedingToFeedingByIdResponse(dbResult.get());
    }

    @PostMapping("/feeding")
    public CreateNewFeedingResponse createNewFeeding(@RequestBody CreateNewFeedingRequest createNewFeedingRequest){
        var feeding = this.feedingMapper.mapCreateNewFeedingRequestToFeeding(createNewFeedingRequest);
        var petResult = this.petRepository.findById(createNewFeedingRequest.getPetId());
        if(petResult.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "pet does not exist"
            );
        }
        var pet = petResult.get();
        pet.addFeeding(feeding);
        feedingRepository.save(feeding);
        var response = this.feedingMapper.mapFeedingToCreateNewFeedingResponse(feeding);
        return response;
    }

    @PutMapping("/feeding/{id}")
    public UpdateFeedingResponse updateFeeding(@RequestBody UpdateFeedingRequest updateFeedingRequest, @PathVariable Integer id) {
        var dbResult = feedingRepository.findById(id);
        if(dbResult.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "entity not found"
            );
        }
        var feeding = dbResult.get();
        updateFeeding(updateFeedingRequest, feeding);
        feedingRepository.save(feeding);
        return this.feedingMapper.mapFeedingToUpdateFeedingResponse(feeding);
    }

    private static void updateFeeding(UpdateFeedingRequest updateFeedingRequest, Feeding feeding) {
        feeding.setFoodType(updateFeedingRequest.getFoodType());
        feeding.setBrand(updateFeedingRequest.getBrand());
        feeding.setQuantity(updateFeedingRequest.getQuantity());
        feeding.setUnitOfMeasure(updateFeedingRequest.getUnitOfMeasure());
        feeding.setTimeOfDay(updateFeedingRequest.getTimeOfDay());
        feeding.setMedicines(updateFeedingRequest.getMedicines());
        feeding.setDose(updateFeedingRequest.getDose());
        feeding.setName(updateFeedingRequest.getName());
    }

    @DeleteMapping("/feeding/{id}")
    public ResponseEntity<String> deleteFeeding(@PathVariable Integer id) {
        var dbResult = feedingRepository.findById(id);
        if(dbResult.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "entity not found"
            );
        }
        var feeding = dbResult.get();
        feedingRepository.delete(feeding);
        return new ResponseEntity<>("Deleted", HttpStatus.OK);
    }
}
