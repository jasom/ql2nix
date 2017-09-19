
{ buildLispPackage, stdenv, fetchurl, lisp-project_cxml-rpc, 
   lisp_parse-number, lisp_hunchentoot, lisp_drakma, lisp_cl-base64, lisp_cxml,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parse-number lisp_hunchentoot lisp_drakma lisp_cl-base64 lisp_cxml  ];
      inherit stdenv;
      systemName = "cxml-rpc";
      
      sourceProject = "${lisp-project_cxml-rpc}";
      patches = [];
      lisp_dependencies = "${lisp_parse-number} ${lisp_hunchentoot} ${lisp_drakma} ${lisp_cl-base64} ${lisp_cxml}";
      name = "lisp_cxml-rpc-20121013-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
