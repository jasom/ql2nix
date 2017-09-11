
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-epmd, 
   lisp_com-gigamonkeys-binary-data, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-gigamonkeys-binary-data lisp_usocket  ];
      inherit stdenv;
      systemName = "epmd";
      
      sourceProject = "${lisp-project_cl-epmd}";
      patches = [];
      lisp_dependencies = "${lisp_com-gigamonkeys-binary-data} ${lisp_usocket}";
      name = "lisp_epmd-20140211-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
