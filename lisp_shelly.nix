
{ buildLispPackage, stdenv, fetchurl, lisp-project_shelly, 
   lisp_babel, lisp_bordeaux-threads, lisp_cl-fad, lisp_local-time, lisp_split-sequence, lisp_trivial-signal,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_bordeaux-threads lisp_cl-fad lisp_local-time lisp_split-sequence lisp_trivial-signal  ];
      inherit stdenv;
      systemName = "shelly";
      
      sourceProject = "${lisp-project_shelly}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_bordeaux-threads} ${lisp_cl-fad} ${lisp_local-time} ${lisp_split-sequence} ${lisp_trivial-signal}";
      name = "lisp_shelly-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
