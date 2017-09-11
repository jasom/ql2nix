
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-binary-data, 
   lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria  ];
      inherit stdenv;
      systemName = "com.gigamonkeys.binary-data";
      
      sourceProject = "${lisp-project_monkeylib-binary-data}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria}";
      name = "lisp_com-gigamonkeys-binary-data-20111203-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
