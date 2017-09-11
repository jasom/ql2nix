
{ buildLispPackage, stdenv, fetchurl, lisp-project_lisp-zmq, 
   lisp_bordeaux-threads, lisp_fiveam, lisp_zmq,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_fiveam lisp_zmq  ];
      inherit stdenv;
      systemName = "zmq-test";
      
      sourceProject = "${lisp-project_lisp-zmq}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_fiveam} ${lisp_zmq}";
      name = "lisp_zmq-test-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
