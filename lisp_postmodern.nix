
{ buildLispPackage, stdenv, fetchurl, lisp-project_postmodern, 
   lisp_usocket, lisp_bordeaux-threads, lisp_closer-mop, lisp_md5,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_bordeaux-threads lisp_closer-mop lisp_md5  ];
      inherit stdenv;
      systemName = "postmodern";
      
      sourceProject = "${lisp-project_postmodern}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_bordeaux-threads} ${lisp_closer-mop} ${lisp_md5}";
      name = "lisp_postmodern-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
