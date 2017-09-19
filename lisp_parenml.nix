
{ buildLispPackage, stdenv, fetchurl, lisp-project_parenml, 
   lisp_esrap, lisp_common-doc-plump, lisp_plump,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_esrap lisp_common-doc-plump lisp_plump  ];
      inherit stdenv;
      systemName = "parenml";
      
      sourceProject = "${lisp-project_parenml}";
      patches = [];
      lisp_dependencies = "${lisp_esrap} ${lisp_common-doc-plump} ${lisp_plump}";
      name = "lisp_parenml-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
