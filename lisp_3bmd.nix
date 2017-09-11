
{ buildLispPackage, stdenv, fetchurl, lisp-project_3bmd, 
   lisp_alexandria, lisp_esrap, lisp_split-sequence,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_esrap lisp_split-sequence  ];
      inherit stdenv;
      systemName = "3bmd";
      
      sourceProject = "${lisp-project_3bmd}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_esrap} ${lisp_split-sequence}";
      name = "lisp_3bmd-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
