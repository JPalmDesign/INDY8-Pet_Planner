package com.indy8.petplanner.config;

import com.indy8.petplanner.clients.*;
import com.indy8.petplanner.domain.Client;

import java.util.List;
import java.util.stream.Collectors;

public class ClientMapper {
    public ClientByIdResponse mapClientToClientByIdResponse(Client client) {
        var response = new ClientByIdResponse();

        response.setId(client.getId());
        response.setFirstName(client.getFirstName());
        response.setLastName(client.getLastName());
        response.setPhoneNumber(client.getPhoneNumber());
        response.setAddress(client.getAddress());
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

        List<ClientDocument> documents = client.getDocuments().stream().map(document -> {
            var clientDocument = new ClientDocument();
            clientDocument.setId(document.getId());
            clientDocument.setName(document.getName());
            return clientDocument;
        }).collect(Collectors.toList());

        response.setClientDocumentList(documents);
        return response;
    }

    public CreateNewClientResponse mapClientToCreateNewClientResponse(Client client) {
        var response = new CreateNewClientResponse();

        response.setId(client.getId());
        response.setFirstName(client.getFirstName());
        response.setLastName(client.getLastName());
        response.setPhoneNumber(client.getPhoneNumber());
        response.setAddress(client.getAddress());
        response.setState(client.getState());
        response.setCity(client.getCity());
        response.setZip(client.getZip());

        return response;
    }

    public Client mapCreateNewClientRequestToClient(CreateNewClientRequest request) {
        var client = new Client();

        client.setFirstName(request.getFirstName());
        client.setLastName(request.getLastName());
        client.setPhoneNumber(request.getPhoneNumber());
        client.setAddress(request.getAddress());
        client.setState(request.getState());
        client.setCity(request.getCity());
        client.setZip(request.getZip());

        return client;
    }

    public UpdateClientResponse mapClientToUpdateClientResponse(Client client) {
        var response = new UpdateClientResponse();

        response.setId(client.getId());
        response.setFirstName(client.getFirstName());
        response.setLastName(client.getLastName());
        response.setPhoneNumber(String.valueOf(client.getPhoneNumber()));
        response.setAddress(client.getAddress());
        response.setState(client.getState());
        response.setCity(client.getCity());
        response.setZip(String.valueOf(client.getZip()));
        return response;
    }

}
