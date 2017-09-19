
{ buildLispPackage, stdenv, fetchurl, lisp-project_helambdap, 
   lisp_xhtmlambda, lisp_split-sequence, lisp_cl-fad,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_xhtmlambda lisp_split-sequence lisp_cl-fad  ];
      inherit stdenv;
      systemName = "helambdap";
      
      sourceProject = "${lisp-project_helambdap}";
      patches = [];
      lisp_dependencies = "${lisp_xhtmlambda} ${lisp_split-sequence} ${lisp_cl-fad}";
      name = "lisp_helambdap-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
