
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack, 
   lisp_quri, lisp_flexi-streams, lisp_cl-fastcgi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_quri lisp_flexi-streams lisp_cl-fastcgi  ];
      inherit stdenv;
      systemName = "clack-handler-fcgi";
      
      sourceProject = "${lisp-project_clack}";
      patches = [];
      lisp_dependencies = "${lisp_quri} ${lisp_flexi-streams} ${lisp_cl-fastcgi}";
      name = "lisp_clack-handler-fcgi-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
