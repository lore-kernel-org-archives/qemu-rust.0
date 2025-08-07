Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAF1C87FCF
	for <qemu-rust@archiver.kernel.org>; Thu,  7 Aug 2025 13:51:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uk11F-0004gD-15; Thu, 07 Aug 2025 09:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uk11D-0004cS-Os
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 09:50:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uk11B-0000Ls-P7
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 09:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754574650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PvaorgGh5P0tSa23iMIJ9bc8NLt/ryhr9OaKS4s4BuY=;
 b=Tdagdu7mp5bMRye1pS1+19Q26dtzzIYkS0fwmh/Iiqs3PJhJ1h5+fUTnJvbTmIHaJDhhBf
 aqAZxKlUUtdqB/M/byPu1qrdLLmfqtkU0lJUTorqmlRfcYAKcy68ULgki80jaN1iVilDg1
 5YXSY2sFD7hCxPCT9pUoeR9TaIZ+CTw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-5wKbXgCLPeOZkyaZlA1lvA-1; Thu, 07 Aug 2025 09:50:49 -0400
X-MC-Unique: 5wKbXgCLPeOZkyaZlA1lvA-1
X-Mimecast-MFC-AGG-ID: 5wKbXgCLPeOZkyaZlA1lvA_1754574648
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-459d7ed90baso7722755e9.2
 for <qemu-rust@nongnu.org>; Thu, 07 Aug 2025 06:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754574648; x=1755179448;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PvaorgGh5P0tSa23iMIJ9bc8NLt/ryhr9OaKS4s4BuY=;
 b=JkiPiDfgtR3shfR4Aa5facDKldrSl7WJKHF8FUAKM0osp7qFiAE1Bzt0ZSYfv4xiU1
 Jm8iX2e8dU7Wd550DACFZw74gCfHYSYxKBfbecoxpIrogDkLmEgoWRP/pCQAccJ9HC2I
 ZNGQhEycOzna5n6fbNlY9pk2PauNQfHj81FfugzphtB30oRrJO7udH6WYWowHFTMmC33
 bCVfDp3YkQ3w110fmU4Uz0fiHMoc055IZDXR8de9ruqICjwBvCBvtCXTL8/CWjeFOGu1
 Ctxszi8hnH2n4k8qforODBBP14AruTtuDZvHC0nDzZgvPViBrXuwFE+itQ23UFdH70Cl
 OyCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrr2GZvD16/yA3xMYs+NngzYHv+S+YylQ8Qec34HmSjew2P0loDtnv/aakhbV/Xw6C0R8ZLPiP/XQ=@nongnu.org
X-Gm-Message-State: AOJu0YyyLXVbKzLwsl+l2HdaZ733u2lIdvG2HPisx9xis0MlmP08Ndy6
 Cgg2GUoQHMPJjvoR0mZu/JNAQ9O1jtEwLC61b9/giraQ0zINKHqJQVs/AeYy1zFhkU6M4l2SYSO
 5ZPNP/3V82UPHPIUuGZSikQigJU96AOfQMcjxrYl4KL5cVe+UX6rmNhc=
X-Gm-Gg: ASbGncsPEAxWEAcDw+5FOA1jzqyeI5AWM24oBLR9LmtggbHqNXbR8rfyBJeXrCoP1Ul
 dp21Ay9TbXgbDVsPdPHbJbaudMH1jBIJ6CqDf35mcwbJRNnenfujm2RcQ2fvXnUfywaKkIYc85V
 4BFrLWZi8k8WzQhTj6oZ1nARsi679XitzLPdlJQbxan9XQKcTtaraFsmZVN3kqCQG5q2rW2zM6I
 1VhD5aLqMn8hQ7rw6hqR6aWX+o2LOCaPu9LjywSNREOM6oiHJQcNVackzcol0sZthkYQXXYqCXv
 gv4r/WwdZJODoRw+hPaVMtvheMaGVG6kkikdpnMIqKA3
X-Received: by 2002:a05:600c:34ce:b0:43c:e70d:44f0 with SMTP id
 5b1f17b1804b1-459e78a2d72mr67612775e9.19.1754574648117; 
 Thu, 07 Aug 2025 06:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWnCGRUMrYINcgGsMYQVVtZx8JpmqrXEJr4bBJ5kaqWhqrByFa4hggqbjHwXhQjMepngWg+w==
X-Received: by 2002:a05:600c:34ce:b0:43c:e70d:44f0 with SMTP id
 5b1f17b1804b1-459e78a2d72mr67612405e9.19.1754574647596; 
 Thu, 07 Aug 2025 06:50:47 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.253.173])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-459e58554f2sm92269425e9.12.2025.08.07.06.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 06:50:46 -0700 (PDT)
Message-ID: <3ce35920-919b-4caf-87c5-b92bd603388a@redhat.com>
Date: Thu, 7 Aug 2025 15:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 24/26] rust/memory: Provide AddressSpace bindings
To: Zhao Liu <zhao1.liu@intel.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Junjie Mao <junjie.mao@hotmail.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>
References: <20250807123027.2910950-1-zhao1.liu@intel.com>
 <20250807123027.2910950-25-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250807123027.2910950-25-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6f_8oYUPd9BO9BVad5sES1as4oPFOT9oaElxVGlXtn4_1754574648
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On 8/7/25 14:30, Zhao Liu wrote:
> +impl GuestAddressSpace for AddressSpace {
> +    type M = FlatView;
> +    type T = FlatViewRefGuard;
> +
> +    /// Get the memory of the [`AddressSpace`].
> +    ///
> +    /// This function retrieves the [`FlatView`] for the current
> +    /// [`AddressSpace`].  And it should be called from an RCU
> +    /// critical section.  The returned [`FlatView`] is used for
> +    /// short-term memory access.
> +    ///
> +    /// Note, this function method may **panic** if [`FlatView`] is
> +    /// being distroying.  Fo this case, we should consider to providing
> +    /// the more stable binding with [`bindings::address_space_get_flatview`].
> +    fn memory(&self) -> Self::T {
> +        let flatp = unsafe { address_space_to_flatview(self.0.as_mut_ptr()) };
> +        FlatViewRefGuard::new(unsafe { Self::M::from_raw(flatp) }).expect(
> +            "Failed to clone FlatViewRefGuard: the FlatView may have been destroyed concurrently.",
> +        )

This is essentially address_space_get_flatview().  You can call it 
directly, or you need to loop if FlatViewRefGuard finds a zero reference 
count.

> +    }
> +}
> +
> +impl AddressSpace {
> +    /// The write interface of `AddressSpace`.
> +    ///
> +    /// This function is similar to `address_space_write` in C side.
> +    ///
> +    /// But it assumes the memory attributes is MEMTXATTRS_UNSPECIFIED.
> +    pub fn write(&self, buf: &[u8], addr: GuestAddress) -> Result<usize> {
> +        rcu_read_lock();
> +        let r = self.memory().deref().write(buf, addr);
> +        rcu_read_unlock();

self.memory() must not need rcu_read_lock/unlock around it, they should 
be called by the memory() function itself.

> +        r.map_err(guest_mem_err_to_qemu_err)
> +    }

I think it's ok to return the vm-memory error.  Ultimately, the error 
will be either ignored or turned into a device error condition, but I 
don't think it's ever going to become an Error**.

> +    /// The store interface of `AddressSpace`.
> +    ///
> +    /// This function is similar to `address_space_st{size}` in C side.
> +    ///
> +    /// But it only assumes @val follows target-endian by default. So ensure
> +    /// the endian of `val` aligned with target, before using this method.

QEMU is trying to get rid of target endianness.  We should use the 
vm-memory BeNN and LeNN as much as possible.  It would be great if you 
could write either

     ADDRESS_SPACE_MEMORY.store::<Le32>(addr, 42);

or

     let n = Le32(42);
     ADDRESS_SPACE_MEMORY.store(addr, n);

but not

     ADDRESS_SPACE_MEMORY.store(addr, 42);

(Also I've not looked at the patches closely enough, but wouldn't 
store() use *host* endianness? Same in patch 23).

Paolo

> +    /// And it assumes the memory attributes is MEMTXATTRS_UNSPECIFIED.
> +    pub fn store<T: AtomicAccess>(&self, addr: GuestAddress, val: T) -> Result<()> {
> +        rcu_read_lock();
> +        let r = self.memory().deref().store(val, addr, Ordering::Relaxed);
> +        rcu_read_unlock();
> +        r.map_err(guest_mem_err_to_qemu_err)
> +    }
> +
> +    /// The load interface of `AddressSpace`.
> +    ///
> +    /// This function is similar to `address_space_ld{size}` in C side.
> +    ///
> +    /// But it only support target-endian by default.  The returned value is
> +    /// with target-endian.
> +    ///
> +    /// And it assumes the memory attributes is MEMTXATTRS_UNSPECIFIED.
> +    pub fn load<T: AtomicAccess>(&self, addr: GuestAddress) -> Result<T> {
> +        rcu_read_lock();
> +        let r = self.memory().deref().load(addr, Ordering::Relaxed);
> +        rcu_read_unlock();
> +        r.map_err(guest_mem_err_to_qemu_err)
> +    }
> +}
> +
> +/// The safe binding around [`bindings::address_space_memory`].
> +///
> +/// `ADDRESS_SPACE_MEMORY` provides the complete address space
> +/// abstraction for the whole Guest memory.
> +pub static ADDRESS_SPACE_MEMORY: &AddressSpace = unsafe {
> +    let ptr: *const bindings::AddressSpace = addr_of!(address_space_memory);
> +
> +    // SAFETY: AddressSpace is #[repr(transparent)].
> +    let wrapper_ptr: *const AddressSpace = ptr.cast();
> +
> +    // SAFETY: `address_space_memory` structure is valid in C side during
> +    // the whole QEMU life.
> +    &*wrapper_ptr
> +};


