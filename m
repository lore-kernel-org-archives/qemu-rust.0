Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uHfrS-000852-P4
	for mharc-qemu-rust@gnu.org; Wed, 21 May 2025 05:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uHfrR-00084i-8g
 for qemu-rust@nongnu.org; Wed, 21 May 2025 05:35:41 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uHfrL-0000y2-VO
 for qemu-rust@nongnu.org; Wed, 21 May 2025 05:35:40 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ad216a5a59cso925277666b.3
 for <qemu-rust@nongnu.org>; Wed, 21 May 2025 02:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747820133; x=1748424933; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AWBAKfnqZycymN3WJWS0hkWG8MSAZGAaCy5DopdBUIs=;
 b=Smq99zMCpLXX6b/PHWFLqSOdxDmg/PZGKzgo3gXlwkHZ1w0IRiJWNOkrBhZZ5e6Usd
 UEWcZAx7RlgUtidfI9SAjHm1Xw3MQJYj/Wa6U6qp97h8CmpXPzGwbMMofOhLYIVAPOA0
 5AwagxRpR97ahs8Qrq53A4HhT9NBVsMx12vL48C+gtXYqxtXBaNP9z6b7B8bGlBiOR/q
 ZD4INB6UIiGjxal0bAYmyUTLsE7jl6O60dMBiiHiOSUPfKWWhcA7ihooRdqEgQoOz1rg
 7GnkSCRe1Ned4eRx+8L5unpU36SXDN938Lcq6gMNhYEmnmyJZ8yfR+az0fb/RIG+yxcz
 dcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747820133; x=1748424933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AWBAKfnqZycymN3WJWS0hkWG8MSAZGAaCy5DopdBUIs=;
 b=VPFb4ksF7BKEAExl2UMkyTdswk4LR62IXqTOuo/LtnbvcScVL7vTBeQM3voZG9lLwB
 exq+s39kwkgURtBfDhvBl4WDeX7TiMUeKQohKsQNacTZYBJ1PmEIQZocT25vdo0RHdB3
 kTqGMocg/J/QP3AI7N6cQANx/9/OpQEr9DimEp/390BRKuAEGzbVtbZGUQD4IhdETWwV
 YIKDNJZQMvmujx+pZfV7lBpTo/qvnRflc9Bsynzd3VARFwgubr4uYNO79SwOwO4CdKxw
 j7u+vbDbXusCfg1e0dTbugBqd+4iOcRoSLqx3UzvkoZ3a+HUsimFZIVV8NMjJECQ0Thc
 AzvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSo/LMwATEwBiRbb35QlkpGiVW+gggzQlTFXAhhTKI5U+oJrdjXddNRtp++kZ9E3bAgFJr4V2qBfM=@nongnu.org
X-Gm-Message-State: AOJu0Yx+plWLLxN+5xWnQjU3BEsiya+t7HtxvI04JFFiJjz/QPIKkbID
 1pRcfYJImODOkVG/5I8rXYZ9JwaIeIkzQnG7y7H5P591NnikiqX410W3Jtic1JtKMdnO8PdZ7Uv
 TgmAqPghVqCfoLMLupgA5bdn/Izkix+l3xZRxnXcw9g==
X-Gm-Gg: ASbGncuwRbs8HO/NpwcqfcVcoQoabtDXR7NpBGbqeS3A5Yz5sKsRUokGtOW6PoSf+F8
 KLW2bqvZ9TmqmZHxxp7zcfsaCmCGhAupe6ZBpt4QWNaUOPQL6sMjYM/ykRD4Huc5vtwVtSt1YfX
 CnIiS3Zcp2JaMg3MgnnPeH35Qa26/PPE4RNeVI9io=
X-Google-Smtp-Source: AGHT+IHF9LH01an0iC3l0lzCYZnI+jsjds66HFA1ceOas2GWN/PTYemUEapZO9OmTMVWNgWwwDhESId088qOd2H7W1k=
X-Received: by 2002:a17:907:3d11:b0:ad2:35db:a727 with SMTP id
 a640c23a62f3a-ad52d4ce22cmr1746038766b.19.1747820133086; Wed, 21 May 2025
 02:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <d3d1944e-2482-4aa7-b621-596246a08107@gnu.org>
 <aCysct2L8Bosqy0N@intel.com>
 <abe683f2-e679-4579-b68a-38a11d41e00b@gnu.org> <aC2R4BOR2tsYgEFI@intel.com>
 <CAHFMJ7vsgPtfkpBkjvh_-NqKszEDj5UpWThU3rPjN9N4X5s0tA@mail.gmail.com>
In-Reply-To: <CAHFMJ7vsgPtfkpBkjvh_-NqKszEDj5UpWThU3rPjN9N4X5s0tA@mail.gmail.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 21 May 2025 12:35:06 +0300
X-Gm-Features: AX0GCFvOlyMEhDT6bjmixXQ4M3gY5B9KXrKZvlcMcIErp3GVIO3_-Gp59oRl6M8
Message-ID: <CAAjaMXb01Y3qoH56j4GsfJLQMRkA067mHjiWS86cr95akh4ckg@mail.gmail.com>
Subject: Re: Rust in QEMU update, April 2025
To: Paolo Bonzini <bonzini@gnu.org>
Cc: Zhao Liu <zhao1.liu@intel.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-rust@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 21 May 2025 09:35:41 -0000

On Wed, May 21, 2025 at 11:36=E2=80=AFAM Paolo Bonzini <bonzini@gnu.org> wr=
ote:
>
>
>
> Il mer 21 mag 2025, 10:21 Zhao Liu <zhao1.liu@intel.com> ha scritto:
>>
>> I also realize that once FlatRange/FlatView is associated with GuestMemo=
ryRegion/
>> GuestMemory, it changes the usual practice in QEMU, where most memory op=
erations
>> are built around MemoryRegion/AddressSpace.
>
>
> That shouldn't be a problem. In QEMU and vm-memory DMA always starts from=
 Address space/GuestAddressSpace, not from MemoryRegion, so if QEMU impleme=
nts GuestAddressSpace in qemu_api::AddressSpace everything matches well. Th=
e only difference is that Rust code will do something like
>
>   AddressSpace::MEMORY::memory().read(...)
>
> (which retrieves the FlatView) instead of
>
>   address_space_read(&address_space_memory, ...)
>
> But that's just how the API is defined. It seems good to me. The mismatch=
 between MemoryRegion and GuestMemoryRegion is confusing, but will be mostl=
y hidden behind the prelude because Guest* are traits not structs.
>
>> > So... not sure what to do there.  It seems like vm-memory is very clos=
e to
>> > being usable by QEMU, but maybe not completely. :(
>>
>> Is it possible or necessary for vm-memory to support overlap? Because I
>> feel that if it is possible, the problem might be simplified. (As a
>> beginner, I have yet to understand exactly how difficult it is.)
>
>
> I don't think that's necessary. Just like in QEMU C code we have AddressS=
pace for DMA and MemoryRegion for hierarchy, in Rust code you have qemu_api=
::{AddressSpace,MemoryRegion}. FlatView, FlatRange, MemoryRegionSection are=
 hidden in both cases, and users don't care much about which type implement=
s GuestMemoryRegion because all they see is AddressSpace. Again, it's all h=
idden behind the prelude.
>
> The real problem is how hard it is to remove the references from the vm-m=
emory API... Maybe not much.
>
> Paolo
>
>>
>> Thanks,
>> Zhao
>>
>>

vm-memory is a very rigid API unfortunately. It's excellent for
rust-vmm purposes. I presume it's possible to figure out a clever
solution to satisfy both rust-vmm and QEMU use needs but I'm not sure
it's worth it. It's really hard to retrofit other projects into
vm-memory if they don't use rust-vmm crates API design and it might
make both rust-vmm code and QEMU code more complex. QEMU would depend
on rust-vmm architectural decisions and vice-versa. The thing I'm
fearing most is needing to refactor memory APIs in QEMU in the future
and turn the vm-memory dependency into technical debt.

Perhaps it's more sensible to not use external dependencies to wrap
over our APIs but we can surely design our Rust bindings inspired by
them. I think it's an inescapable consequence of QEMU's internals
being fluid over time and "private"/unstable.

Personal anecdote: I tried using vm-memory on a personal TCG-like
emulator I am writing for fun, and I found it a daunting task as new
rust-vmm concepts appeared into my codebase as "scope creep". And I
wasn't even adapting an existing API to vm-memory, but designing a new
one based on it. I gave it up after a few days.

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

