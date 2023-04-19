package com.indy8.petplanner.clients;

import com.indy8.petplanner.config.ClientMapper;
import com.indy8.petplanner.dataaccess.ClientRepository;
import jakarta.websocket.server.PathParam;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;

@RestController
public class ClientsController {

    private final ClientRepository clientRepository;
    private final ClientMapper clientMapper;

    public ClientsController(ClientRepository clientRepository, ClientMapper clientMapper) {
        this.clientRepository = clientRepository;
        this.clientMapper = clientMapper;
    }

    @GetMapping("/client")
    public List<ClientByIdResponse> getAllClients() {
        var dbResult = clientRepository.findAll();
        var response = new ArrayList<ClientByIdResponse>();
        for(var client : dbResult) {
            response.add(this.clientMapper.mapClientToClientByIdResponse(client));
        }
        return response;
    }

    @GetMapping("/client/{id}")
    public ClientByIdResponse getClientById(@PathParam(value = "id") Integer id) {
        var dbResult = clientRepository.findById(id);
        if(dbResult.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "client not found"
            );
        }
        return this.clientMapper.mapClientToClientByIdResponse(dbResult.get());
    }

    @PostMapping("/client")
    public CreateNewClientResponse createNewClient(@RequestBody CreateNewClientRequest createNewClientRequest) {
        var client = this.clientMapper.mapCreateNewClientRequestToClient(createNewClientRequest);
        clientRepository.save(client);
        var response = this.clientMapper.mapClientToCreateNewClientResponse(client);
        return response;
    }
}
