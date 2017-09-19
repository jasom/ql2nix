
{ buildLispPackage, stdenv, fetchurl, lisp-project_swank-client, 
   lisp_usocket, lisp_swank, lisp_com-google-base, lisp_bordeaux-threads,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_swank lisp_com-google-base lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "swank-client";
      
      sourceProject = "${lisp-project_swank-client}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_swank} ${lisp_com-google-base} ${lisp_bordeaux-threads}";
      name = "lisp_swank-client-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
