
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-jsx, 
   lisp_named-readtables, lisp_esrap, lisp_cl-who,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_named-readtables lisp_esrap lisp_cl-who  ];
      inherit stdenv;
      systemName = "cl-jsx";
      
      sourceProject = "${lisp-project_cl-jsx}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables} ${lisp_esrap} ${lisp_cl-who}";
      name = "lisp_cl-jsx-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
