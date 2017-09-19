
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-zmq, 
  zeromq,   lisp_trivial-garbage, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_cffi-grovel zeromq ];
      inherit stdenv;
      systemName = "zeromq";
      
      sourceProject = "${lisp-project_cl-zmq}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_cffi-grovel}";
      name = "lisp_zeromq-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
