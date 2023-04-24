package com.indy8.petplanner.feedings;

import com.indy8.petplanner.config.FeedingMapper;
import com.indy8.petplanner.dataaccess.FeedingRepository;
import com.indy8.petplanner.dataaccess.PetRepository;
import org.springframework.http.HttpStatus;
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
    public FeedingByIdResponse getFeedingById(@RequestParam(value = "id") Integer id) {
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
}
