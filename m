Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uRoFE-0002r1-Cw
	for mharc-qemu-rust@gnu.org; Wed, 18 Jun 2025 04:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uRoFC-0002qj-J0
 for qemu-rust@nongnu.org; Wed, 18 Jun 2025 04:34:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uRoF9-0001IK-Hw
 for qemu-rust@nongnu.org; Wed, 18 Jun 2025 04:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750235640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8+7qm2QOt4HDeG9l0wtWmNg5ozuJh8NqO4G3QAepq4g=;
 b=Ks6gYeeLVcUNiLNgVUyPQFLRd20QncAizocfQbZgkOyy0GZtyjbD9NyZVCOOcg39evzlTP
 DmeN5j+ImLiTwCpeERyepO0FA3k7KpXB3CpjgjldkyENBIzSn8uAffDZ6pBWzXRbs+yJdd
 GoSL1LdZzvU0wOtA6sNyAnv2TBvdiDc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-LhuxDew_NWKR3-NT1FpJig-1; Wed, 18 Jun 2025 04:33:59 -0400
X-MC-Unique: LhuxDew_NWKR3-NT1FpJig-1
X-Mimecast-MFC-AGG-ID: LhuxDew_NWKR3-NT1FpJig_1750235638
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ad5697c4537so48633466b.0
 for <qemu-rust@nongnu.org>; Wed, 18 Jun 2025 01:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750235638; x=1750840438;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8+7qm2QOt4HDeG9l0wtWmNg5ozuJh8NqO4G3QAepq4g=;
 b=I4uKaSK0Fpu+iiUiJshyx8Ip+4de/T3Nq/dMTFYxmj9Z95j69NezZKryJy8E8F92de
 W0qflNM69nhxvz+eBvecLEoktEGoFxBUHYeFWV2apVfCI9TNCG+LrjJ3Azgqgd/xgVZH
 nYv21QbkKEkysMSZei/I44Peno8+7hOJOyFO3fLtZZ/PaYCXeZYRvxd2UYYb1BL4tpUz
 ZySM/jxyxwn5cJInYMpSTKoe+VNY6qt3djsoQKO2I1ELX9WA+xKro1r3f5UouNpjEt1G
 avO9DLRJvKxCxFL0KzLw51fmqLpoQbJiOrV4lMVCy6e2asoMnaJl4mub6HTr2LNiS/0c
 5MfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyQngvI61YgjoIvvePRuTautciNwIwZLvEQM8hA0tULgqFTRT0nx2KdrfpS1HZbxX6l7uCkwCufjQ=@nongnu.org
X-Gm-Message-State: AOJu0YwE0TKZmpgn+BXBfPibFLvfFZu5Y2QPriMqpr3H4GFnezK0geK6
 oelfQFyqxFv/lZsTMWfjKrUMgxpohXzHqWfsuptBTFuEfVM41YFhVYTm4nEm5wJp0sBs/jpE8ZX
 9Kl2c1SPDnxAG/Z8QfZFdgsdvB1Ot0HFYnJk60byAIXSQ13DeNY8ZB/TE6g8+HG+0hNyd3+Mejd
 fNIdlI+tNtWXA3hhdXzvPSuv35+SDnOVC9DqJZIw==
X-Gm-Gg: ASbGncvFigohu1XM+Hv2Ep7eFsAW67NJbiSogr/DOoEMjUKE/bv1befEGY13RTXDu2F
 Bjn1sEOnou/Ut9ZKyixmRm71UG8hU15S6NLChWNAdbG4dUmSbecmTqBkieEpu8z/SK1PE7Gl6vu
 W+En4=
X-Received: by 2002:a17:907:fd15:b0:ad8:93a3:29c2 with SMTP id
 a640c23a62f3a-ae01f776416mr168824166b.14.1750235637662; 
 Wed, 18 Jun 2025 01:33:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsV3u1ClSgt8OoUXKBlV7V9QDsSQHpYeFYOE2GMyGGQsALPPKSFqZ4mKstFH7U+TB6Sr7fSr1TtpxZgzTM4OY=
X-Received: by 2002:a05:6000:386:b0:3a5:7944:c9f with SMTP id
 ffacd0b85a97d-3a58e13fb12mr1354282f8f.2.1750235266692; Wed, 18 Jun 2025
 01:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250605101124.367270-1-pbonzini@redhat.com>
 <875xgu95a0.fsf@pond.sub.org>
In-Reply-To: <875xgu95a0.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 18 Jun 2025 10:27:35 +0200
X-Gm-Features: Ac12FXyDE8ZZGtQt4QQZvafhgjJsN8mxstQmRlx91AhrC-E6Bvl_1kbSsLYxPv4
Message-ID: <CABgObfZgp82HKSv3-CFL-MD-86LGQQGcAPYi83Q8Qhq_HbiORQ@mail.gmail.com>
Subject: Re: [PATCH preview 0/3] reviving minimal QAPI generation from 2021
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-rust@nongnu.org, Martin Kletzander <mkletzan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 43UGjvfd7jFghiA1SnH3SIvaY5JyX0K4xk9fUCxG0SY_1750235638
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000584b660637d467ed"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.89,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jun 2025 08:34:06 -0000

--000000000000584b660637d467ed
Content-Type: text/plain; charset="UTF-8"

Il mar 17 giu 2025, 09:49 Markus Armbruster <armbru@redhat.com> ha scritto:

> pylint isn't happy with the new module:
>

Fixed, will post a new version.

Can I pick your brain on whether to focus on Rust<->QObject conversion or
give the Rust structs the full visitor treatment? (See other messages in
reply to the cover letter).

Paolo


************* Module qapi.rs_types
> scripts/qapi/rs_types.py:286:4: W0237: Parameter 'branches' has been
> renamed to 'variants' in overriding
> 'QAPISchemaGenRsTypeVisitor.visit_object_type' method (arguments-renamed)
> scripts/qapi/rs_types.py:307:4: W0237: Parameter 'alternatives' has been
> renamed to 'variants' in overriding
> 'QAPISchemaGenRsTypeVisitor.visit_alternate_type' method (arguments-renamed)
> scripts/qapi/rs_types.py:316:67: W0613: Unused argument 'builtins'
> (unused-argument)
> scripts/qapi/rs_types.py:9:0: W0611: Unused POINTER_SUFFIX imported from
> common (unused-import)
> scripts/qapi/rs_types.py:10:0: W0611: Unused rs_ctype_parse imported from
> rs (unused-import)
> scripts/qapi/rs_types.py:18:0: W0611: Unused QAPISchemaEnumType imported
> from schema (unused-import)
> scripts/qapi/rs_types.py:18:0: W0611: Unused QAPISchemaType imported from
> schema (unused-import)
>
>
> Might be too early to bother with the type hints, but here goes anyway:
>
> $ mypy scripts/qapi-gen.py
> scripts/qapi/schema.py:70: error: Argument 1 to "rsgen_ifcond" has
> incompatible type "str | dict[str, object] | None"; expected "str |
> dict[str, Any]"  [arg-type]
> scripts/qapi/rs.py:99: error: Incompatible types in assignment (expression
> has type "str | None", variable has type "dict[str, str]")  [assignment]
> scripts/qapi/rs.py:103: error: Unsupported left operand type for +
> ("None")  [operator]
> scripts/qapi/rs.py:103: note: Left operand is of type "str | None"
> scripts/qapi/rs.py:103: error: Incompatible types in assignment
> (expression has type "str | Any", variable has type "dict[str, str]")
> [assignment]
> scripts/qapi/rs.py:106: error: Incompatible types in assignment
> (expression has type "str", variable has type "dict[str, str]")
> [assignment]
> scripts/qapi/rs.py:108: error: Incompatible types in assignment
> (expression has type "str", variable has type "dict[str, str]")
> [assignment]
> scripts/qapi/rs.py:110: error: Incompatible types in assignment
> (expression has type "str", variable has type "dict[str, str]")
> [assignment]
> scripts/qapi/rs.py:111: error: Incompatible return value type (got
> "dict[str, str]", expected "str")  [return-value]
> scripts/qapi/rs_types.py:47: error: Item "None" of "QAPISchemaVariants |
> None" has no attribute "tag_member"  [union-attr]
> scripts/qapi/rs_types.py:49: error: Item "None" of "QAPISchemaVariants |
> None" has no attribute "variants"  [union-attr]
> scripts/qapi/rs_types.py:84: error: Item "None" of "QAPISchemaVariants |
> None" has no attribute "variants"  [union-attr]
> scripts/qapi/rs_types.py:116: error: Incompatible default for argument
> "exclude" (default has type "None", argument has type "list[str]")
> [assignment]
> scripts/qapi/rs_types.py:116: note: PEP 484 prohibits implicit Optional.
> Accordingly, mypy has changed its default to no_implicit_optional=True
> scripts/qapi/rs_types.py:116: note: Use
> https://github.com/hauntsaninja/no_implicit_optional to automatically
> upgrade your codebase
> scripts/qapi/rs_types.py:118: error: Incompatible return value type (got
> "list[str]", expected "str")  [return-value]
> scripts/qapi/rs_types.py:251: error: Item "None" of "QAPISchemaVariants |
> None" has no attribute "variants"  [union-attr]
> scripts/qapi/rs_types.py:309: error: Argument 2 of "visit_alternate_type"
> is incompatible with supertype "QAPISchemaVisitor"; supertype defines the
> argument type as "QAPISourceInfo | None"  [override]
> scripts/qapi/rs_types.py:309: note: This violates the Liskov substitution
> principle
> scripts/qapi/rs_types.py:309: note: See
> https://mypy.readthedocs.io/en/stable/common_issues.html#incompatible-overrides
> Found 15 errors in 3 files (checked 1 source file)
>
>

--000000000000584b660637d467ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il mar 17 giu 2025, 09:49 Markus=
 Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&=
gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
pylint isn&#39;t happy with the new module:<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Fixed, will post a new version.=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Can I pick your b=
rain on whether to focus on Rust&lt;-&gt;QObject conversion or give the Rus=
t structs the full visitor treatment? (See other messages in reply to the c=
over letter).</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
************* Module qapi.rs_types<br>
scripts/qapi/rs_types.py:286:4: W0237: Parameter &#39;branches&#39; has bee=
n renamed to &#39;variants&#39; in overriding &#39;QAPISchemaGenRsTypeVisit=
or.visit_object_type&#39; method (arguments-renamed)<br>
scripts/qapi/rs_types.py:307:4: W0237: Parameter &#39;alternatives&#39; has=
 been renamed to &#39;variants&#39; in overriding &#39;QAPISchemaGenRsTypeV=
isitor.visit_alternate_type&#39; method (arguments-renamed)<br>
scripts/qapi/rs_types.py:316:67: W0613: Unused argument &#39;builtins&#39; =
(unused-argument)<br>
scripts/qapi/rs_types.py:9:0: W0611: Unused POINTER_SUFFIX imported from co=
mmon (unused-import)<br>
scripts/qapi/rs_types.py:10:0: W0611: Unused rs_ctype_parse imported from r=
s (unused-import)<br>
scripts/qapi/rs_types.py:18:0: W0611: Unused QAPISchemaEnumType imported fr=
om schema (unused-import)<br>
scripts/qapi/rs_types.py:18:0: W0611: Unused QAPISchemaType imported from s=
chema (unused-import)<br>
<br>
<br>
Might be too early to bother with the type hints, but here goes anyway:<br>
<br>
$ mypy scripts/qapi-gen.py <br>
scripts/qapi/schema.py:70: error: Argument 1 to &quot;rsgen_ifcond&quot; ha=
s incompatible type &quot;str | dict[str, object] | None&quot;; expected &q=
uot;str | dict[str, Any]&quot;=C2=A0 [arg-type]<br>
scripts/qapi/rs.py:99: error: Incompatible types in assignment (expression =
has type &quot;str | None&quot;, variable has type &quot;dict[str, str]&quo=
t;)=C2=A0 [assignment]<br>
scripts/qapi/rs.py:103: error: Unsupported left operand type for + (&quot;N=
one&quot;)=C2=A0 [operator]<br>
scripts/qapi/rs.py:103: note: Left operand is of type &quot;str | None&quot=
;<br>
scripts/qapi/rs.py:103: error: Incompatible types in assignment (expression=
 has type &quot;str | Any&quot;, variable has type &quot;dict[str, str]&quo=
t;)=C2=A0 [assignment]<br>
scripts/qapi/rs.py:106: error: Incompatible types in assignment (expression=
 has type &quot;str&quot;, variable has type &quot;dict[str, str]&quot;)=C2=
=A0 [assignment]<br>
scripts/qapi/rs.py:108: error: Incompatible types in assignment (expression=
 has type &quot;str&quot;, variable has type &quot;dict[str, str]&quot;)=C2=
=A0 [assignment]<br>
scripts/qapi/rs.py:110: error: Incompatible types in assignment (expression=
 has type &quot;str&quot;, variable has type &quot;dict[str, str]&quot;)=C2=
=A0 [assignment]<br>
scripts/qapi/rs.py:111: error: Incompatible return value type (got &quot;di=
ct[str, str]&quot;, expected &quot;str&quot;)=C2=A0 [return-value]<br>
scripts/qapi/rs_types.py:47: error: Item &quot;None&quot; of &quot;QAPISche=
maVariants | None&quot; has no attribute &quot;tag_member&quot;=C2=A0 [unio=
n-attr]<br>
scripts/qapi/rs_types.py:49: error: Item &quot;None&quot; of &quot;QAPISche=
maVariants | None&quot; has no attribute &quot;variants&quot;=C2=A0 [union-=
attr]<br>
scripts/qapi/rs_types.py:84: error: Item &quot;None&quot; of &quot;QAPISche=
maVariants | None&quot; has no attribute &quot;variants&quot;=C2=A0 [union-=
attr]<br>
scripts/qapi/rs_types.py:116: error: Incompatible default for argument &quo=
t;exclude&quot; (default has type &quot;None&quot;, argument has type &quot=
;list[str]&quot;)=C2=A0 [assignment]<br>
scripts/qapi/rs_types.py:116: note: PEP 484 prohibits implicit Optional. Ac=
cordingly, mypy has changed its default to no_implicit_optional=3DTrue<br>
scripts/qapi/rs_types.py:116: note: Use <a href=3D"https://github.com/haunt=
saninja/no_implicit_optional" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://github.com/hauntsaninja/no_implicit_optional</a> to automaticall=
y upgrade your codebase<br>
scripts/qapi/rs_types.py:118: error: Incompatible return value type (got &q=
uot;list[str]&quot;, expected &quot;str&quot;)=C2=A0 [return-value]<br>
scripts/qapi/rs_types.py:251: error: Item &quot;None&quot; of &quot;QAPISch=
emaVariants | None&quot; has no attribute &quot;variants&quot;=C2=A0 [union=
-attr]<br>
scripts/qapi/rs_types.py:309: error: Argument 2 of &quot;visit_alternate_ty=
pe&quot; is incompatible with supertype &quot;QAPISchemaVisitor&quot;; supe=
rtype defines the argument type as &quot;QAPISourceInfo | None&quot;=C2=A0 =
[override]<br>
scripts/qapi/rs_types.py:309: note: This violates the Liskov substitution p=
rinciple<br>
scripts/qapi/rs_types.py:309: note: See <a href=3D"https://mypy.readthedocs=
.io/en/stable/common_issues.html#incompatible-overrides" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://mypy.readthedocs.io/en/stable/common_=
issues.html#incompatible-overrides</a><br>
Found 15 errors in 3 files (checked 1 source file)<br>
<br>
</blockquote></div></div></div>

--000000000000584b660637d467ed--


