
{ buildLispPackage, stdenv, fetchurl, lisp-project_plexippus-xpath, 
   lisp_yacc, lisp_cl-ppcre, lisp_parse-number, lisp_cxml,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_yacc lisp_cl-ppcre lisp_parse-number lisp_cxml  ];
      inherit stdenv;
      systemName = "xpath";
      
      sourceProject = "${lisp-project_plexippus-xpath}";
      patches = [];
      lisp_dependencies = "${lisp_yacc} ${lisp_cl-ppcre} ${lisp_parse-number} ${lisp_cxml}";
      name = "lisp_xpath-20120909-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
