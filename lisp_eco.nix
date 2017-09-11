
{ buildLispPackage, stdenv, fetchurl, lisp-project_eco, 
   lisp_cl-who, lisp_esrap, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-who lisp_esrap lisp_split-sequence  ];
      inherit stdenv;
      systemName = "eco";
      
      sourceProject = "${lisp-project_eco}";
      patches = [];
      lisp_dependencies = "${lisp_cl-who} ${lisp_esrap} ${lisp_split-sequence}";
      name = "lisp_eco-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
