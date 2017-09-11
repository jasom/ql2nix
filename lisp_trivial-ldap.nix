
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-ldap, 
   lisp_cl-ssl, lisp_usocket, lisp_yacc,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ssl lisp_usocket lisp_yacc  ];
      inherit stdenv;
      systemName = "trivial-ldap";
      
      sourceProject = "${lisp-project_trivial-ldap}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ssl} ${lisp_usocket} ${lisp_yacc}";
      name = "lisp_trivial-ldap-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }