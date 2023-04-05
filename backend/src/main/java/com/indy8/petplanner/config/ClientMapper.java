package com.indy8.petplanner.config;

import com.indy8.petplanner.clients.ClientByIdResponse;
import com.indy8.petplanner.clients.ClientPet;
import com.indy8.petplanner.clients.CreateNewClientRequest;
import com.indy8.petplanner.clients.CreateNewClientResponse;
import com.indy8.petplanner.domain.Client;

import java.util.List;
import java.util.stream.Collectors;

public class ClientMapper {
    public ClientByIdResponse mapClientToClientByIdResponse(Client client) {
        var response = new ClientByIdResponse();

        response.setId(client.getId());
        response.setFirstName(client.getFirstName());
        response.setMiddleInitial(client.getMiddleInitial());
        response.setLastName(client.getLastName());
        response.setPhoneNumber(client.getPhoneNumber());
        response.setAddressLine1(client.getAddressLine1());
        response.setAddressLine2(client.getAddressLine2());
        response.setCity(client.getCity());
        response.setState(client.getState());
        response.setZip(client.getZip());

        List<ClientPet> pets = client.getPets().stream().map(pet -> {
            var clientPet = new ClientPet();
            clientPet.setId(pet.getId());
            clientPet.setName(pet.getName());
            return clientPet;
        }).collect(Collectors.toList());

        response.setClientPetList(pets);
        return response;
    }

    public CreateNewClientResponse mapClientToCreateNewClientResponse(Client client) {
        var response = new CreateNewClientResponse();

        response.setId(client.getId());
        response.setFirstName(client.getFirstName());
        response.setMiddleInitial(client.getMiddleInitial());
        response.setLastName(client.getLastName());
        response.setPhoneNumber(client.getPhoneNumber());
        response.setAddressLine1(client.getAddressLine1());
        response.setAddressLine2(client.getAddressLine2());
        response.setState(client.getState());
        response.setCity(client.getCity());
        response.setZip(client.getZip());

        return response;
    }

    public Client mapCreateNewClientRequestToClient(CreateNewClientRequest request) {
        var client = new Client();

        client.setFirstName(request.getFirstName());
        client.setMiddleInitial(request.getMiddleInitial());
        client.setLastName(request.getLastName());
        client.setPhoneNumber(request.getPhoneNumber());
        client.setAddressLine1(request.getAddressLine1());
        client.setAddressLine2(request.getAddressLine2());
        client.setState(request.getState());
        client.setCity(request.getCity());
        client.setZip(request.getZip());

        return client;
    }
}
