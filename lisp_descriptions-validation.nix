
{ buildLispPackage, stdenv, fetchurl, lisp-project_descriptions, 
   lisp_clavier, lisp_closer-mop, lisp_sheeple, lisp_anaphora, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clavier lisp_closer-mop lisp_sheeple lisp_anaphora lisp_alexandria  ];
      inherit stdenv;
      systemName = "descriptions.validation";
      
      sourceProject = "${lisp-project_descriptions}";
      patches = [];
      lisp_dependencies = "${lisp_clavier} ${lisp_closer-mop} ${lisp_sheeple} ${lisp_anaphora} ${lisp_alexandria}";
      name = "lisp_descriptions-validation-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }