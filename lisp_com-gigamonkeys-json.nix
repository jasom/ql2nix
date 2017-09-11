
{ buildLispPackage, stdenv, fetchurl, lisp-project_monkeylib-json, 
   lisp_com-gigamonkeys-parser,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-gigamonkeys-parser  ];
      inherit stdenv;
      systemName = "com.gigamonkeys.json";
      
      sourceProject = "${lisp-project_monkeylib-json}";
      patches = [];
      lisp_dependencies = "${lisp_com-gigamonkeys-parser}";
      name = "lisp_com-gigamonkeys-json-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
