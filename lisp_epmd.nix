
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-epmd, 
   lisp_usocket, lisp_com-gigamonkeys-binary-data,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_com-gigamonkeys-binary-data  ];
      inherit stdenv;
      systemName = "epmd";
      
      sourceProject = "${lisp-project_cl-epmd}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_com-gigamonkeys-binary-data}";
      name = "lisp_epmd-20140211-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
