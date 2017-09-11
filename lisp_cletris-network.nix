
{ buildLispPackage, stdenv, fetchurl, lisp-project_cletris, 
   lisp_cl-log, lisp_cl-ppcre, lisp_cletris, lisp_usocket,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-log lisp_cl-ppcre lisp_cletris lisp_usocket  ];
      inherit stdenv;
      systemName = "cletris-network";
      
      sourceProject = "${lisp-project_cletris}";
      patches = [];
      lisp_dependencies = "${lisp_cl-log} ${lisp_cl-ppcre} ${lisp_cletris} ${lisp_usocket}";
      name = "lisp_cletris-network-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
