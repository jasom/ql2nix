
{ buildLispPackage, stdenv, fetchurl, lisp-project_inquisitor, 
   lisp_anaphora, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_alexandria  ];
      inherit stdenv;
      systemName = "inquisitor";
      
      sourceProject = "${lisp-project_inquisitor}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_alexandria}";
      name = "lisp_inquisitor-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
