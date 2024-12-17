Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tNamK-0004ad-Dx
	for mharc-qemu-rust@gnu.org; Tue, 17 Dec 2024 11:50:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tNamD-0004VT-4K
 for qemu-rust@nongnu.org; Tue, 17 Dec 2024 11:50:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tNamB-00043D-Bh
 for qemu-rust@nongnu.org; Tue, 17 Dec 2024 11:50:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734454225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hu/9pdkuiuanNzhJ1wScBiefsC05dTNERTjnpoqBxdo=;
 b=DOrnIg0CLVnKfTlJ5wG8J2zzgp2yt+jICnrkCemDRdPwtQjzq4I3gRoZqUvOChK2gJyUXF
 mgJtiiiYRo5OW1vO3EeQe/dP6bjz0XHMAl0kdo6DADl5iP4YJ743vZoXHTeBzG/V2OKUVg
 gPMFlK70Y8sEf337OFbfXExkvloSjfk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-ZmOZ6W2vMMqZF-JfzPtI_g-1; Tue, 17 Dec 2024 11:50:23 -0500
X-MC-Unique: ZmOZ6W2vMMqZF-JfzPtI_g-1
X-Mimecast-MFC-AGG-ID: ZmOZ6W2vMMqZF-JfzPtI_g
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3862c67763dso2284216f8f.3
 for <qemu-rust@nongnu.org>; Tue, 17 Dec 2024 08:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734454222; x=1735059022;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hu/9pdkuiuanNzhJ1wScBiefsC05dTNERTjnpoqBxdo=;
 b=UUdS/kzDiV3DPTKUds5mojCDvVSCGsZ0oKR760418y7Wm3PVC9E8xwY/anGOKCLvqt
 Og3cNmKVM3b8eevvV1HL6Vk+MP1Vg7ld4dS/pZ65u3tuuhlOX9mELKpy9ec7s7aAzngQ
 zLQQkmSir/NLbJ5vatiUTgfREOHvcJ0hW7gUEsCGvFo57cF0y2Jat1yhdQ7aHWAlQnSh
 OwsEEDD2Ufwgc9F1aT8botgOsP61Xn8Vz5R5bu8+xKzxu2erhyK1vHvVOH7PoOVQ35na
 SvWvV6PX5FF8RjbckkOZkhMdDbkK4Jyo57tQbqP3vbAJ91CjJ9d1DBOJVLVwmFYNFhgS
 wG6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo4sJbiX20Wu224kFhoqiN/HGINhlmK4Nd2RJN/wOYChfCL9NGv/YEw5CIi+lsK8nkZywGLzCQ3k4=@nongnu.org
X-Gm-Message-State: AOJu0Yyx+oRWhGs0wVqaFZbfPFVQyjPITqrjmMJR0BUS7jk5Ownl5TGt
 U9Jg5I+rBoK3o2hzD09/hf6xyDxDj5eCsjt2p8IUimGhISgoDD+eUyqwPKThwUZBUTEUSAMTWg4
 f4PYaCNiEb6ZJhMpMn2l7b7ikfTBvNiRnG5WH2EGY9WDP0chD6Dalh+iVr3ylM1pdhfNGGaQYwt
 jV320Wn6/NdN41vKO7lvUgfOpjVA==
X-Gm-Gg: ASbGncujTVaqq5xYycOvXbCDxttbWyqQ6e2QtQmAYR5F0UIBE+uHLpNaA9wsDmx9FHH
 z+a578WFY6jA2rE1kBw/LoQevSjqnhDXKyITUiw==
X-Received: by 2002:a5d:64a3:0:b0:386:424e:32d5 with SMTP id
 ffacd0b85a97d-38880acd269mr13718791f8f.14.1734454221842; 
 Tue, 17 Dec 2024 08:50:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpAKXuMxm8PmVpDOYptZdwoYh7en457ZACuuF/qAiP1urP0GySIE7gZoVfi534zqQhJo0rnNVWBb/33Im2cy8=
X-Received: by 2002:a5d:64a3:0:b0:386:424e:32d5 with SMTP id
 ffacd0b85a97d-38880acd269mr13718774f8f.14.1734454221455; Tue, 17 Dec 2024
 08:50:21 -0800 (PST)
MIME-Version: 1.0
References: <20241209123717.99077-1-pbonzini@redhat.com>
 <20241209123717.99077-25-pbonzini@redhat.com>
 <Z2D2zk2Wdlqc5q2k@intel.com>
In-Reply-To: <Z2D2zk2Wdlqc5q2k@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 17 Dec 2024 17:50:09 +0100
Message-ID: <CABgObfY=jyu96eZ+ZcU9GXU+amt2wRm53vpvubHYTaeY9MWd2A@mail.gmail.com>
Subject: Re: [PATCH 24/26] rust: qom: move device_id to PL011 class side
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 Junjie Mao <junjie.mao@hotmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TEmgJthQfirJVxaqguV5fr3EXPFnnd_NF_YPPtJuQRw_1734454222
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000bfe2e606297a1755"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.116,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 17 Dec 2024 16:50:31 -0000

--000000000000bfe2e606297a1755
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mar 17 dic 2024, 04:39 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> > +impl ClassInitImpl<PL011Class> for PL011State {
> > +    fn class_init(klass: &mut PL011Class) {
> > +        klass.device_id =3D DeviceId::ARM;
> > +        <Self as ClassInitImpl<SysBusDeviceClass>>::class_init(&mut
> klass.parent_class);
>
> This seems a bit of a conflict with the C version of QOM semantics. In C,
> class_init is registered in TypeInfo, and then the QOM code will
> automatically call the parent's class_init without needing to explicitly
> call the parent's in the child's class_init.
>

This is the same in Rust.

The difference is that in C you have a single class_init function that sets
all members of ObjectClass, DeviceClass, etc. In Rust each class has one
trait and there is a chain of ClassInitImpl implementations=E2=80=94one fil=
ling in
"oc" from ObjectImpl, one filling in "dc" from DeviceImpl and so on.

But in both cases you get a chain of calls from qom/object.c.

Therefore, the call here seems valid from the code logic's perspective.
> But, when there is deeper class inheritance, it seems impossible to
> prevent class_init from being called both by the C side's QOM code and by
> this kind of recursive case on the Rust side.
>

Note that here you have two parameters: what class is being filled (the
argument C of ClassInitImpl<C>) *and* what type is being initialized
(that's Self).

The "recursion" is only on the argument C, and matches the way C code
implements class_init.

Maybe the confusion is because I implemented class_init twice instead of
using a separate trait "PL011Impl"?

Paolo

So, for devices like SysBusDevice that are registered on the C side,
> should we not implement class_init and also not call it explicitly?
>
> Or should we distinguish between two different usages of class_init? One
> is registered in TypeInfo (only as a callback in rust_class_init) - perha=
ps
> rename it as qom_class_init, and the other is used as a helper for
> Rust-side
> calls (similar to the recursive usage here) - maybe rename it as
> class_inter_init.
>
> > +    }
> > +}
>
>

--000000000000bfe2e606297a1755
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il mar 17 dic 2024, 04:39 Zhao L=
iu &lt;<a href=3D"mailto:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; h=
a scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; =
+impl ClassInitImpl&lt;PL011Class&gt; for PL011State {<br>
&gt; +=C2=A0 =C2=A0 fn class_init(klass: &amp;mut PL011Class) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 klass.device_id =3D DeviceId::ARM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;Self as ClassInitImpl&lt;SysBusDevice=
Class&gt;&gt;::class_init(&amp;mut klass.parent_class);<br>
<br>
This seems a bit of a conflict with the C version of QOM semantics. In C,<b=
r>
class_init is registered in TypeInfo, and then the QOM code will<br>
automatically call the parent&#39;s class_init without needing to explicitl=
y<br>
call the parent&#39;s in the child&#39;s class_init.<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">This is the same in Rus=
t.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The difference is tha=
t in C you have a single class_init function that sets all members of Objec=
tClass, DeviceClass, etc. In Rust each class has one trait and there is a c=
hain of ClassInitImpl implementations=E2=80=94one filling in &quot;oc&quot;=
 from ObjectImpl, one filling in &quot;dc&quot; from DeviceImpl and so on.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">But in both cases you ge=
t a chain of calls from qom/object.c.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Therefore, the call here seems valid =
from the code logic&#39;s perspective.<br>
But, when there is deeper class inheritance, it seems impossible to<br>
prevent class_init from being called both by the C side&#39;s QOM code and =
by<br>
this kind of recursive case on the Rust side.<br></blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Note that here you have two pa=
rameters: what class is being filled (the argument C of ClassInitImpl&lt;C&=
gt;) *and* what type is being initialized (that&#39;s Self).</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">The &quot;recursion&quot; is only on =
the argument C, and matches the way C code implements class_init.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Maybe the confusion is because I =
implemented class_init twice instead of using a separate trait &quot;PL011I=
mpl&quot;?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail=
_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">So, for=
 devices like SysBusDevice that are registered on the C side,<br>
should we not implement class_init and also not call it explicitly?<br>
<br>
Or should we distinguish between two different usages of class_init? One<br=
>
is registered in TypeInfo (only as a callback in rust_class_init) - perhaps=
<br>
rename it as qom_class_init, and the other is used as a helper for Rust-sid=
e<br>
calls (similar to the recursive usage here) - maybe rename it as<br>
class_inter_init.<br>
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
<br>
</blockquote></div></div></div>

--000000000000bfe2e606297a1755--


