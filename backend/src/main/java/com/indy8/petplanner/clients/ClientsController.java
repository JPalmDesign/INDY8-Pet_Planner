package com.indy8.petplanner.clients;

import com.indy8.petplanner.config.ClientMapper;
import com.indy8.petplanner.dataaccess.ClientRepository;
import com.indy8.petplanner.domain.Client;
import jakarta.websocket.server.PathParam;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
    public ClientByIdResponse getClientById(@PathVariable Integer id) {
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
        return this.clientMapper.mapClientToCreateNewClientResponse(client);
    }

    @PutMapping("/client/{id}")
    public UpdateClientResponse updateClient(@RequestBody UpdateClientRequest updateClientRequest, @PathVariable Integer id) {
        var dbResult = clientRepository.findById(id);
        if(dbResult.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "client not found"
            );
        }
        var client = dbResult.get();
        updateClient(updateClientRequest, client);
        clientRepository.save(client);
        return this.clientMapper.mapClientToUpdateClientResponse(client);
    }

    private static void updateClient(UpdateClientRequest updateClientRequest, Client client) {
        client.setFirstName(updateClientRequest.getFirstName());
        client.setLastName(updateClientRequest.getLastName());
        client.setPhoneNumber(Long.parseLong(updateClientRequest.getPhoneNumber()));
        client.setEmail(updateClientRequest.getEmail());
        client.setAddress(updateClientRequest.getAddress());
        client.setCity(updateClientRequest.getCity());
        client.setState(updateClientRequest.getState());
        client.setZip(Integer.parseInt(updateClientRequest.getZip()));
    }

    @DeleteMapping("/client/{id}")
    public ResponseEntity<String> deleteClient(@PathVariable Integer id) {
        var dbResult = clientRepository.findById(id);
        if(dbResult.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "client not found"
            );
        }
        clientRepository.delete(dbResult.get());
        return new ResponseEntity<>("client deleted", HttpStatus.OK);
    }
}
