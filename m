Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uHqYO-0002dl-Ek
	for mharc-qemu-rust@gnu.org; Wed, 21 May 2025 17:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHqYD-0002cn-DR
 for qemu-rust@nongnu.org; Wed, 21 May 2025 17:00:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHqYA-0002rJ-5z
 for qemu-rust@nongnu.org; Wed, 21 May 2025 17:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747861227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tPM8Q8KC2jlJZCIfPNHU2X9UqxtpMbIyJNccZNCX5oo=;
 b=SKP+1oPmt9KQ1GzRuLq1qqa5G5V+rTHp0rYD9/+5rFP8b67I65lgB46SInuPAb8fpL2+sL
 vDimvooLUaD+SLAtYi2EhPY2vyW4XtBdMN0aCHa8KTbN3Q9JW72jiFePF6wNpohrIpLcmm
 ccakSivSRaaFKU4jT0YM8sjqpj+eh68=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-U5q_ozBTPVWRGX5OA4ZRUQ-1; Wed, 21 May 2025 17:00:26 -0400
X-MC-Unique: U5q_ozBTPVWRGX5OA4ZRUQ-1
X-Mimecast-MFC-AGG-ID: U5q_ozBTPVWRGX5OA4ZRUQ_1747861225
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a34f19c977so3514587f8f.0
 for <qemu-rust@nongnu.org>; Wed, 21 May 2025 14:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747861225; x=1748466025;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tPM8Q8KC2jlJZCIfPNHU2X9UqxtpMbIyJNccZNCX5oo=;
 b=wCFRLvvwM3KPw7h0NjzX193qfEXYV7Aqrtx/3i5UoOmc4YZU+bUNdfqe9TMCvhowzP
 tcbleW2HG3gaD+cSTeHipsfuAB1nqdiCYfL7vBXeZTcOOw3MNePuwi8mtKUS3aBr9oJ7
 aj6SG53vlm848bko/kfVxqLtcQgjsCSK904PY4HQYek8pUuMB63KN2to0KFG68od8+3I
 5GFrbp027kQ+4Fn+uO9YOlHGpwoqp9VBmMezP7E+dNz7nk//VeRxyNKaxoL04PHR6HuI
 hJPIlgsWYafpOWN51nPHNl6AW4JfxmkSL3ro9xyq55F1MWL2G1xtaWF2/t5cq5Au0KvM
 1L8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNwpaU+48qTZ0IiQwqzwPupLKzx44Y7q05XdgrdsfS2bqQNzeepr0NfY+Naa/9WVGtnhQQm2sR6Mo=@nongnu.org
X-Gm-Message-State: AOJu0YxAAYJazBoi548nPFAybJDGzv+WZNz6y3up3XuSLwa+zYIuif3S
 5Lfrottmva7vEAA28fqNyXyD1Ng8qlIJmXgDvyBbuVPxPpo5e6cT3sf1J9fOpgwmN8TcHVzUAX+
 Xi4MvnD2gA64pfAXGfjSpmpMRW0fkUNr21ijAJ5NK4fSrSDzRxIpah6qGhrIh6YtSQG3mRPpxTo
 IOzofDEaJcxsYwgt9uLSxwtqMhIAdxnQ==
X-Gm-Gg: ASbGncsNp9MPt8VYx/T5R98spv+jiCHJLFVSjLcv8y0p2/wN2LofRqDYsL0vsWHgqI0
 6xOVY+e03VmKYqK/GwVmgCkW7yxSurwxAi0Tpksr8qVlOln0EvWoWDKcrb9jCEA8jhF4=
X-Received: by 2002:a05:6000:240e:b0:3a3:7117:1bba with SMTP id
 ffacd0b85a97d-3a371171d64mr12815022f8f.24.1747861224722; 
 Wed, 21 May 2025 14:00:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvJyhHk+YBHa6LMZpm9YPQmXQddzQ+ukFlB9UmX0AIiueHd0HBpB7CvuEUU88Pk3J5tYypU9z46zAIl8wpCYs=
X-Received: by 2002:a05:6000:240e:b0:3a3:7117:1bba with SMTP id
 ffacd0b85a97d-3a371171d64mr12815000f8f.24.1747861224316; Wed, 21 May 2025
 14:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <d3d1944e-2482-4aa7-b621-596246a08107@gnu.org>
 <aCysct2L8Bosqy0N@intel.com>
 <abe683f2-e679-4579-b68a-38a11d41e00b@gnu.org> <aC2R4BOR2tsYgEFI@intel.com>
 <CAHFMJ7vsgPtfkpBkjvh_-NqKszEDj5UpWThU3rPjN9N4X5s0tA@mail.gmail.com>
In-Reply-To: <CAHFMJ7vsgPtfkpBkjvh_-NqKszEDj5UpWThU3rPjN9N4X5s0tA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 May 2025 23:00:11 +0200
X-Gm-Features: AX0GCFsTpOh5YtxtjZMKD_WAiop2q5DVcqeWDYswI3lila-8LHW2og-gyJDTgbI
Message-ID: <CABgObfYye21gpU=6btq3vT-7uj81qp7eWiuxb9Ztw2D7vWguJQ@mail.gmail.com>
Subject: Re: Rust in QEMU update, April 2025
To: Paolo Bonzini <bonzini@gnu.org>
Cc: Zhao Liu <zhao1.liu@intel.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-rust@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QgiTCmPQpD0xVJ_sUYWwijm6dubW_la0rY_RGWH7Eos_1747861225
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006478990635aba7cb"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.184,
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
X-List-Received-Date: Wed, 21 May 2025 21:00:38 -0000

--0000000000006478990635aba7cb
Content-Type: text/plain; charset="UTF-8"

Il mer 21 mag 2025, 10:37 Paolo Bonzini <bonzini@gnu.org> ha scritto:

> > So... not sure what to do there.  It seems like vm-memory is very close
> to
>
>> > being usable by QEMU, but maybe not completely. :(
>>
>> Is it possible or necessary for vm-memory to support overlap? Because I
>> feel that if it is possible, the problem might be simplified. (As a
>> beginner, I have yet to understand exactly how difficult it is.)
>>
>
> I don't think that's necessary. Just like in QEMU C code we have
> AddressSpace for DMA and MemoryRegion for hierarchy, in Rust code you have
> qemu_api::{AddressSpace,MemoryRegion}. FlatView, FlatRange,
> MemoryRegionSection are hidden in both cases, and users don't care much
> about which type implements GuestMemoryRegion because all they see is
> AddressSpace. Again, it's all hidden behind the prelude.
>
> The real problem is how hard it is to remove the references from the
> vm-memory API... Maybe not much.
>

Brain dump ahead! AddressSpaceDispatch is already storing
MemoryRegionSections. Therefore it should be possible to make
GuestMemory::R equal to MemoryRegionSection, or rather its Opaque wrapper.

Then one needs to implement Bytes<MemoryRegionAddress> in
MemoryRegionSection like
https://github.com/rust-vmm/vm-memory/blob/3f2fd80b11/src/mmap/mod.rs#L171,
use address_space_lookup_region() to implement find_region(), and (except
for IOMMU) everything should work.

To implement IOMMUs later, it's probably possible to call
flatview_translate() from the try_access() method, which is intended to be
internal but comes in handy here. try_access() is a bit complicated, but
we'll just have to copy some code from the default implementation at
https://github.com/rust-vmm/vm-memory/blob/main/src/guest_memory.rs, in
order to replace the call to find_region(). Notice how
address_space_lookup_region() returns MemoryRegionSection*, which
translates to Option<&Self::R>; while flatview_translate() returns a
MemoryRegionSection by value, that can become a local variable in
try_access() and everything is fine. Hopefully. The compiler will certainly
prove me wrong.

Another thing that will be needed later is support for MemTxAttrs. Maybe
squeeze those into the address, i.e. implement Bytes<(GuestAddress,
MemTxAttrs)> and Bytes<(MemoryRegionAddress, MemTxAttrs)>?

The dirty bitmap does need some changes in vm-memory, but it's pretty small
compared to the mess that I foreshadowed in order to change find_region().

Paolo

--0000000000006478990635aba7cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 21 mag 2025, 10:37 Paolo Bonzini &lt;<a href=3D=
"mailto:bonzini@gnu.org" rel=3D"noreferrer noreferrer noreferrer noreferrer=
" target=3D"_blank">bonzini@gnu.org</a>&gt; ha scritto:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div>&gt; So... n=
ot sure what to do there.=C2=A0 It seems like vm-memory is very close to</d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt; being usable by QEMU, but maybe not completely. :(<br>
<br>
Is it possible or necessary for vm-memory to support overlap? Because I<br>
feel that if it is possible, the problem might be simplified. (As a<br>
beginner, I have yet to understand exactly how difficult it is.)<br></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I don&#39;t=
 think that&#39;s necessary. Just like in QEMU C code we have AddressSpace =
for DMA and MemoryRegion for hierarchy, in Rust code you have qemu_api::{Ad=
dressSpace,MemoryRegion}. FlatView, FlatRange, MemoryRegionSection are hidd=
en in both cases, and users don&#39;t care much about which type implements=
 GuestMemoryRegion because all they see is AddressSpace. Again, it&#39;s al=
l hidden behind the prelude.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">The real problem is how hard it is to remove the references from the v=
m-memory API... Maybe not much.</div></div></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Brain dump ahead! AddressSpaceDispat=
ch is already storing MemoryRegionSections. Therefore it should be possible=
 to make GuestMemory::R equal to MemoryRegionSection, or rather its Opaque =
wrapper.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Then one needs =
to implement Bytes&lt;MemoryRegionAddress&gt; in MemoryRegionSection like <=
a href=3D"https://github.com/rust-vmm/vm-memory/blob/3f2fd80b11/src/mmap/mo=
d.rs#L171" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.c=
om/rust-vmm/vm-memory/blob/3f2fd80b11/src/mmap/mod.rs#L171</a>, use address=
_space_lookup_region() to implement find_region(), and (except for IOMMU) e=
verything should work.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">To implement IOMMUs later, it&#39;s probably possible to call flatview=
_translate() from the try_access() method, which is intended to be internal=
 but comes in handy here. try_access() is a bit complicated, but we&#39;ll =
just have to copy some code from the default implementation at <a href=3D"h=
ttps://github.com/rust-vmm/vm-memory/blob/main/src/guest_memory.rs" rel=3D"=
noreferrer noreferrer noreferrer" target=3D"_blank">https://github.com/rust=
-vmm/vm-memory/blob/main/src/guest_memory.rs</a>, in order to replace the c=
all to find_region(). Notice how address_space_lookup_region() returns Memo=
ryRegionSection*, which translates to Option&lt;&amp;Self::R&gt;; while fla=
tview_translate() returns a MemoryRegionSection by value, that can become a=
 local variable in try_access() and everything is fine. Hopefully. The comp=
iler will certainly prove me wrong.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Another thing that will be needed later is support for MemTxAtt=
rs. Maybe squeeze those into the address, i.e. implement Bytes&lt;(GuestAdd=
ress, MemTxAttrs)&gt; and Bytes&lt;(MemoryRegionAddress, MemTxAttrs)&gt;?</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">The dirty bitmap does nee=
d some changes in vm-memory, but it&#39;s pretty small compared to the mess=
 that I foreshadowed in order to change find_region().</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Paolo</div></div>

--0000000000006478990635aba7cb--


