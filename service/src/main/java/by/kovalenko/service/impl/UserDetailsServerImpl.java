package by.kovalenko.service.impl;

import by.kovalenko.entity.UserEntity;
import by.kovalenko.repositories.UserRepository;
import by.kovalenko.util.UserRole;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Set;

@Service
@Transactional
@RequiredArgsConstructor
public class UserDetailsServerImpl implements UserDetailsService {
    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity findByUsername = userRepository.findByUsername(username);
        if (findByUsername == null) {
            throw new UsernameNotFoundException("User with specified name not found");
        }
        return new org.springframework.security.core.userdetails.User(findByUsername.getUsername(),
                findByUsername.getPassword(), getAuthorities(findByUsername));
    }

    private Set<GrantedAuthority> getAuthorities(UserEntity user) {
        UserRole role = user.getRole();
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        grantedAuthorities.add(new SimpleGrantedAuthority(role.toString()));
        return grantedAuthorities;
    }
}
