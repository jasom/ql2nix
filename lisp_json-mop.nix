
{ buildLispPackage, stdenv, fetchurl, lisp-project_json-mop, 
   lisp_anaphora, lisp_yason, lisp_closer-mop,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_yason lisp_closer-mop  ];
      inherit stdenv;
      systemName = "json-mop";
      
      sourceProject = "${lisp-project_json-mop}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_yason} ${lisp_closer-mop}";
      name = "lisp_json-mop-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
