package com.sahil.springmvc.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "employees") // optional, defaults to "employee"
@Data                       // generates getters, setters, toString, equals, hashCode
@NoArgsConstructor          // generates no-args constructor (needed by JPA)
@AllArgsConstructor         // generates all-args constructor
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String email;
    private long contact;
    private String designation;
    private double salary;
}
