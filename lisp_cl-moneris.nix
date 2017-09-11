
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-moneris, 
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
      systemName = "cl-moneris";
      
      sourceProject = "${lisp-project_cl-moneris}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_s-xml}";
      name = "lisp_cl-moneris-20110418-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
