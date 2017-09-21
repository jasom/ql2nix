
{ buildLispPackage, stdenv, fetchurl, lisp-project_swank-crew, 
   lisp_swank-client, lisp_osicat, lisp_com-google-flag, lisp_com-google-base, lisp_bordeaux-threads,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_swank-client lisp_osicat lisp_com-google-flag lisp_com-google-base lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "swank-crew";
      
      sourceProject = "${lisp-project_swank-crew}";
      patches = [];
      lisp_dependencies = "${lisp_swank-client} ${lisp_osicat} ${lisp_com-google-flag} ${lisp_com-google-base} ${lisp_bordeaux-threads}";
      name = "lisp_swank-crew-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
