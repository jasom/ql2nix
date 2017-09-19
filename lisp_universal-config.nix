
{ buildLispPackage, stdenv, fetchurl, lisp-project_universal-config, 
   lisp_parse-float, lisp_cl-ppcre,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parse-float lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "universal-config";
      
      sourceProject = "${lisp-project_universal-config}";
      patches = [];
      lisp_dependencies = "${lisp_parse-float} ${lisp_cl-ppcre}";
      name = "lisp_universal-config-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
