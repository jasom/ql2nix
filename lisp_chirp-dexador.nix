
{ buildLispPackage, stdenv, fetchurl, lisp-project_chirp, 
   lisp_chirp-core, lisp_dexador,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_chirp-core lisp_dexador  ];
      inherit stdenv;
      systemName = "chirp-dexador";
      
      sourceProject = "${lisp-project_chirp}";
      patches = [];
      lisp_dependencies = "${lisp_chirp-core} ${lisp_dexador}";
      name = "lisp_chirp-dexador-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
