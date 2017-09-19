
{ buildLispPackage, stdenv, fetchurl, lisp-project_clouchdb, 
   lisp_s-base64, lisp_drakma, lisp_closer-mop, lisp_parenscript,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_s-base64 lisp_drakma lisp_closer-mop lisp_parenscript  ];
      inherit stdenv;
      systemName = "clouchdb-examples";
      
      sourceProject = "${lisp-project_clouchdb}";
      patches = [];
      lisp_dependencies = "${lisp_s-base64} ${lisp_drakma} ${lisp_closer-mop} ${lisp_parenscript}";
      name = "lisp_clouchdb-examples_0.0.16";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
