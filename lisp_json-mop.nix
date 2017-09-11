
{ buildLispPackage, stdenv, fetchurl, lisp-project_json-mop, 
   lisp_closer-mop, lisp_yason, lisp_anaphora,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_yason lisp_anaphora  ];
      inherit stdenv;
      systemName = "json-mop";
      
      sourceProject = "${lisp-project_json-mop}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_yason} ${lisp_anaphora}";
      name = "lisp_json-mop-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
