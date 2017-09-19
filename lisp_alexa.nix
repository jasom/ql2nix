
{ buildLispPackage, stdenv, fetchurl, lisp-project_alexa, 
   lisp_cl-ppcre, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_alexandria  ];
      inherit stdenv;
      systemName = "alexa";
      
      sourceProject = "${lisp-project_alexa}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_alexandria}";
      name = "lisp_alexa-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
