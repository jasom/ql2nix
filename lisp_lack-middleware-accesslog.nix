
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_local-time, lisp_ironclad,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_ironclad  ];
      inherit stdenv;
      systemName = "lack-middleware-accesslog";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_ironclad}";
      name = "lisp_lack-middleware-accesslog-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
