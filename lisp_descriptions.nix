
{ buildLispPackage, stdenv, fetchurl, lisp-project_descriptions, 
   lisp_closer-mop, lisp_sheeple, lisp_anaphora, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_sheeple lisp_anaphora lisp_alexandria  ];
      inherit stdenv;
      systemName = "descriptions";
      
      sourceProject = "${lisp-project_descriptions}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_sheeple} ${lisp_anaphora} ${lisp_alexandria}";
      name = "lisp_descriptions-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
