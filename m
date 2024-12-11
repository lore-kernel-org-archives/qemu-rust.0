Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tLIlf-0005Cp-9l
	for mharc-qemu-rust@gnu.org; Wed, 11 Dec 2024 04:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLIld-0005Ak-As
 for qemu-rust@nongnu.org; Wed, 11 Dec 2024 04:12:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLIlU-0000gC-KY
 for qemu-rust@nongnu.org; Wed, 11 Dec 2024 04:12:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733908334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tEB4D8w5ERkbTPmluhdfp6bLR9s6K8ZPsCz0oAzz3h0=;
 b=f3FFs+d30r7CEK3Ijjc3vKPs4NG2eYu8uhgd70Yvj5/xRDhZNkz8rVBWALozYQvW4msr3e
 C6tWlpksnahXeMuhr1t8ErtRQRMb4I/MBZUPWtNburg+FNPsFYdR7n1sK/0V4Uu0A34ccY
 XHqk2fqVDZEOaM6Dd37BFLvo/9QKO6I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-aJTGOI1UOUOrHzIEv61fyQ-1; Wed, 11 Dec 2024 04:12:12 -0500
X-MC-Unique: aJTGOI1UOUOrHzIEv61fyQ-1
X-Mimecast-MFC-AGG-ID: aJTGOI1UOUOrHzIEv61fyQ
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-385fdff9db5so2829598f8f.0
 for <qemu-rust@nongnu.org>; Wed, 11 Dec 2024 01:12:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733908331; x=1734513131;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tEB4D8w5ERkbTPmluhdfp6bLR9s6K8ZPsCz0oAzz3h0=;
 b=rH1bgIEqZLQGyswqRC4aTnIlxjH0rR8fdTVHuVDZWXpYII7k7AvExdhdY/MwiB+FTv
 Npnr2ruHPwpcFLOtvoi2vnVx/yhDi8TI/EBQdmYqNAghf4x8vq1g02u7HEj66gCDR2Vc
 hv1Cu3t2dDRl0tRufXQqfAKkidFnOk2CDeETYH2XjyJoCg/bflWEbfjRXd3D7rAFjL/a
 TR+aDnIy498k0Cyr2Hbk9KiFH/iF7ANpAqsxD0hv5Cd5NipNY9DQ45JHFMTRAV2JU4t8
 YyLNvvZksUADPP18o5g/BdTjd1J899CkbJGV0sjNMzxtJeGDUaytoHnLNcKA2zpWYr0V
 Aaiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhscsZgbQaeLV01Vv23FumjzNsSwEc+DJul6x8DeUuVFjDb146gjim5uwZPIoi/wUZgWq4CKgR4zs=@nongnu.org
X-Gm-Message-State: AOJu0YwNlq+TrKHnfcv5PebEbAWqaoGDwk0KAvnWvmHMFslsu5flHaOg
 H1tXgXPVMl7wuJsX8sWq/mUl8qX6OUQyEq1mx7izz5N+qbNYNDd32UY0Y47Ffw1WgoADlnp8IiP
 KsP+BoJXsxDFE4UqZPgcw4qOgDyomJFqYjLW1D1rnG2zT7GgxovVcNVSTn3ERkG027bjpAejWpB
 SKi+IAY44HBZrvMUDRHiIdwYOhXQ==
X-Gm-Gg: ASbGncs2T3gyslQFLuTqsJ0B5MFtRyzcjLZmBDYE8npHoMNqM2iiQWrkeJ+2QNDwgky
 Y8QjyMZ/v16zxcALX8ec06RQu6V2pJA2n5fU=
X-Received: by 2002:a05:6000:186c:b0:385:edb7:69ba with SMTP id
 ffacd0b85a97d-3864ce4af05mr1758254f8f.1.1733908331594; 
 Wed, 11 Dec 2024 01:12:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgtK0sJJ+3ivpBQWRNHECNMx5xylV4PmeB90lQ6tGjXsXGV7+haZTDbI1qy+/TxBbkrVCJ3+tLTmOHIM3zTYg=
X-Received: by 2002:a05:6000:186c:b0:385:edb7:69ba with SMTP id
 ffacd0b85a97d-3864ce4af05mr1758229f8f.1.1733908331269; Wed, 11 Dec 2024
 01:12:11 -0800 (PST)
MIME-Version: 1.0
References: <20241209123717.99077-1-pbonzini@redhat.com>
 <20241209123717.99077-15-pbonzini@redhat.com>
 <Z1hjX+5Yyi46N+sX@intel.com> <ada60844-546a-42ca-a05f-7b6dc225ff53@redhat.com>
 <Z1lGZdXsVR5ra4hl@intel.com>
In-Reply-To: <Z1lGZdXsVR5ra4hl@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 11 Dec 2024 10:11:59 +0100
Message-ID: <CABgObfbs57rVNU4jTwUbPeZEbvEKpVPAZj0Pd8OF75D8ojQEMQ@mail.gmail.com>
Subject: Re: [PATCH 14/26] rust: qom: move bridge for TypeInfo functions out
 of pl011
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 Junjie Mao <junjie.mao@hotmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZuqMXTGK_3AbgqtrjfMJfzC3gNE2bmpqdWeC6OJF0hk_1733908332
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000028ab310628fafee0"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.52,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 11 Dec 2024 09:12:25 -0000

--00000000000028ab310628fafee0
Content-Type: text/plain; charset="UTF-8"

Il mer 11 dic 2024, 08:41 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> And since we are talking about the safety of INSTANCE_INIT, I think we
> should add some safety guidelines here, like:
>  * Proper Initialization of pointers and references
>  * Explicit initialization of Non-Zero Fields
>  * In placed memory region is correctly initialized.
>

Yes that's pretty much it.

(Or do you have any additional or clearer guidelines?)
>
> This could be the reference when adding SAFETY comment for the device's
> own `unsafe` init(). :-)
>
> And this is also a good explanation to distinguish between initialization
> in init() and realize(). For example, HPET attempts to initialize the
> timer array in realize().
>

Generally:

- embedded objects will have to be initialized in instance_init unless they
are Options

- sysbus_init_irq and sysbus_init_mmio can be called in both instance_init
and instance_post_init for now, but they will have to be in post_init once
the signature of init changes to return impl PinInit

- if you don't need properties you can choose between post_init and
realize, if you need properties you need to initialize in realize (and
then, unlike C, you might need to explicitly allow the pre-realize state;
for example using Option<&...> instead of just a reference; or Vec<>
instead of an array).

>
> > The way that this will become safe is to use the pinned_init crate from
> > Linux: instance_init returns the initialization as an "impl
> PinInit<Self>",
>
> Then do we need to place OBJECT in some suitable memory location (Box or
> something) for Rust implementation?
>

Allocation is still done by the C code, so I am not sure I understand the
question. Rust code allocates QOM objects with object_new() so they are
malloc-ed. I discussed it with Manos some time ago and in principle you
could use a Box (QOM supports custom freeing functions) but it's a bit
complex because the freeing function would have to free the memory without
dropping the contents of the Box (the drop is done by QOM via
instance_finalize).

If you want to allocate the HPETTimers at realize time, I think you can
place them in a Vec. I think you won't need NonNull for this, but I am not
100% sure. Alternatively if you want to always prepare all MAX_TIMERS of
them and then only use a subset, you can use an array.

Either way, probably it makes sense for you to have an "fn
timers_iter(&self) -> impl Iter<Item = &BqlRefCell<HPETTimer>>" in
HPETState, or something like that. Then you can easily use for loops to
walk all timers between 0 and self.num_timers-1.

Paolo

> and then instance_post_init can run with a &self.  Until then, however,
> > instance_init has to remain unsafe.
>
> Thanks for sharing! It's a very reasonable direction.
>
> Regards,
> Zhao
>
>

--00000000000028ab310628fafee0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 11 dic 2024, 08:41 Zhao Liu &lt;<a href=3D"mail=
to:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; ha scritto:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">And since we are talking ab=
out the safety of INSTANCE_INIT, I think we<br>
should add some safety guidelines here, like:<br>
=C2=A0* Proper Initialization of pointers and references<br>
=C2=A0* Explicit initialization of Non-Zero Fields<br>
=C2=A0* In placed memory region is correctly initialized.<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes that&#39;s pre=
tty much it.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
(Or do you have any additional or clearer guidelines?)<br>
<br>
This could be the reference when adding SAFETY comment for the device&#39;s=
<br>
own `unsafe` init(). :-)<br>
<br>
And this is also a good explanation to distinguish between initialization<b=
r>
in init() and realize(). For example, HPET attempts to initialize the<br>
timer array in realize().<br></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Generally:</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">- embedded objects will have to be initialized in instance_init=
 unless they are Options</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>- sysbus_init_irq and sysbus_init_mmio can be called in both instance_init=
 and instance_post_init for now, but they will have to be in post_init once=
 the signature of init changes to return impl PinInit</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">- if you don&#39;t need properties you can ch=
oose between post_init and realize, if you need properties you need to init=
ialize in realize (and then, unlike C, you might need to explicitly allow t=
he pre-realize state; for example using Option&lt;&amp;...&gt; instead of j=
ust a reference; or Vec&lt;&gt; instead of an array).</div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
&gt; The way that this will become safe is to use the pinned_init crate fro=
m<br>
&gt; Linux: instance_init returns the initialization as an &quot;impl PinIn=
it&lt;Self&gt;&quot;,<br>
<br>
Then do we need to place OBJECT in some suitable memory location (Box or<br=
>
something) for Rust implementation?<br></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Allocation is still done by the C code, =
so I am not sure I understand the question. Rust code allocates QOM objects=
 with object_new() so they are malloc-ed. I discussed it with Manos some ti=
me ago and in principle you could use a Box (QOM supports custom freeing fu=
nctions) but it&#39;s a bit complex because the freeing function would have=
 to free the memory without dropping the contents of the Box (the drop is d=
one by QOM via instance_finalize).</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">If you want to allocate the HPETTimers at realize time, I think =
you can place them in a Vec. I think you won&#39;t need NonNull for this, b=
ut I am not 100% sure. Alternatively if you want to always prepare all MAX_=
TIMERS of them and then only use a subset, you can use an array.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Either way, probably it makes sens=
e for you to have an &quot;fn timers_iter(&amp;self) -&gt; impl Iter&lt;Ite=
m =3D &amp;BqlRefCell&lt;HPETTimer&gt;&gt;&quot; in HPETState, or something=
 like that. Then you can easily use for loops to walk all timers between 0 =
and self.num_timers-1.</div><div dir=3D"auto"><br></div><div dir=3D"auto">P=
aolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; and then instance_post_init can run with a &amp;self.=C2=A0 Until then=
, however,<br>
&gt; instance_init has to remain unsafe.<br>
<br>
Thanks for sharing! It&#39;s a very reasonable direction.<br>
<br>
Regards,<br>
Zhao<br>
<br>
</blockquote></div></div></div>

--00000000000028ab310628fafee0--


