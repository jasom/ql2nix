
{ buildLispPackage, stdenv, fetchurl, lisp-project_snooze, 
   lisp_alexandria, lisp_cl-ppcre, lisp_closer-mop, lisp_parse-float, lisp_quri, lisp_rfc2388,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_closer-mop lisp_parse-float lisp_quri lisp_rfc2388  ];
      inherit stdenv;
      systemName = "snooze";
      
      sourceProject = "${lisp-project_snooze}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_closer-mop} ${lisp_parse-float} ${lisp_quri} ${lisp_rfc2388}";
      name = "lisp_snooze-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
