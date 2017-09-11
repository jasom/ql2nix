
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-zmq, 
  zeromq,   lisp_cffi, lisp_cffi-grovel, lisp_trivial-garbage,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cffi-grovel lisp_trivial-garbage zeromq ];
      inherit stdenv;
      systemName = "zeromq";
      
      sourceProject = "${lisp-project_cl-zmq}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cffi-grovel} ${lisp_trivial-garbage}";
      name = "lisp_zeromq-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
