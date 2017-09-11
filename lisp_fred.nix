
{ buildLispPackage, stdenv, fetchurl, lisp-project_fred, 
   lisp_drakma, lisp_s-xml,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_s-xml  ];
      inherit stdenv;
      systemName = "fred";
      
      sourceProject = "${lisp-project_fred}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_s-xml}";
      name = "lisp_fred-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
