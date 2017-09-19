
{ buildLispPackage, stdenv, fetchurl, lisp-project_lisp-zmq, 
  zeromq,   lisp_bordeaux-threads, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cffi-grovel zeromq ];
      inherit stdenv;
      systemName = "zmq";
      
      sourceProject = "${lisp-project_lisp-zmq}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cffi-grovel}";
      name = "lisp_zmq-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
