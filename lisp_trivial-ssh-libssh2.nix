
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-ssh, 
  libssh2,   lisp_trivial-gray-streams, lisp_cl-fad, lisp_usocket, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-gray-streams lisp_cl-fad lisp_usocket lisp_cffi-grovel libssh2 ];
      inherit stdenv;
      systemName = "trivial-ssh-libssh2";
      
      sourceProject = "${lisp-project_trivial-ssh}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-gray-streams} ${lisp_cl-fad} ${lisp_usocket} ${lisp_cffi-grovel}";
      name = "lisp_trivial-ssh-libssh2-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
