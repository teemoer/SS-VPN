package com.wxt.news.entity;

import com.google.common.base.Objects;

import javax.persistence.*;
import java.io.Serializable;

@MappedSuperclass
public abstract class IdEntity implements Serializable {
    private static final long serialVersionUID = 3330350039201346884L;

    protected Long id;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public IdEntity() {
    }

    public IdEntity(Long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return Objects.toStringHelper(this).add("id", id).toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof IdEntity)) return false;
        IdEntity idEntity = (IdEntity) o;
        return Objects.equal(id, idEntity.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}
