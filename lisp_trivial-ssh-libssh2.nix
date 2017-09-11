
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-ssh, 
  libssh2,   lisp_babel, lisp_cffi, lisp_cffi-grovel, lisp_cl-fad, lisp_split-sequence, lisp_trivial-gray-streams, lisp_usocket,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cffi lisp_cffi-grovel lisp_cl-fad lisp_split-sequence lisp_trivial-gray-streams lisp_usocket libssh2 ];
      inherit stdenv;
      systemName = "trivial-ssh-libssh2";
      
      sourceProject = "${lisp-project_trivial-ssh}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cffi} ${lisp_cffi-grovel} ${lisp_cl-fad} ${lisp_split-sequence} ${lisp_trivial-gray-streams} ${lisp_usocket}";
      name = "lisp_trivial-ssh-libssh2-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
