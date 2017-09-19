
{ buildLispPackage, stdenv, fetchurl, lisp-project_rpc4cl, 
   lisp_trivial-timeout, lisp_rfc3339-timestamp, lisp_parse-number, lisp_cxml, lisp_drakma,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-timeout lisp_rfc3339-timestamp lisp_parse-number lisp_cxml lisp_drakma  ];
      inherit stdenv;
      systemName = "rpc4cl";
      
      sourceProject = "${lisp-project_rpc4cl}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-timeout} ${lisp_rfc3339-timestamp} ${lisp_parse-number} ${lisp_cxml} ${lisp_drakma}";
      name = "lisp_rpc4cl-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
